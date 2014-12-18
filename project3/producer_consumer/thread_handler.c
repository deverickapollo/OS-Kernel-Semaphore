#include <stdio.h>
#include <assert.h>

#include "alarm_handler.h"
#include "thread_handler.h"
#include "queue.h"

/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
/* The two macros are extremely useful by turnning on/off interrupts when atomicity is required */
#define DISABLE_INTERRUPTS() {  \
    asm("wrctl status, zero");  \
}

#define ENABLE_INTERRUPTS() {   \
    asm("movi et, 1");          \
    asm("wrctl status, et");    \
}

/* the current running thread */
static tcb *current_running_thread = NULL;

/* pointing to the stack/context of main() */
static unsigned int *main_stack_pointer = NULL;

mysem_t * mutex;
mysem_t *empty;
mysem_t *full;
int size_of_buffer;
int current_remove_pointer;
int current_insert_pointer;
int num_threads;
char buffer[8];

tcb *mythread_create(unsigned int tid, unsigned int stack_size,
		void(*mythread)(unsigned int tid)) {
	unsigned int *tmp_ptr;

	/* allocate a tcb for a thread */
	tcb *thread_pointer;

	thread_pointer = (tcb *) malloc(sizeof(tcb));
	if (thread_pointer == NULL) {
		printf("Unable to allocate space!\n");
		exit(1);
	}

	/* initialize the thread's tcb */
	thread_pointer->tid = tid;
	thread_pointer->stack = (unsigned int *) malloc(sizeof(unsigned int)
			* stack_size);
	if (thread_pointer->stack == NULL) {
		printf("Unable to allocate space!\n");
		exit(1);
	}
	thread_pointer->stack_size = stack_size;
	thread_pointer->stack_pointer = (unsigned int *) (thread_pointer->stack
			+ stack_size - 19);
	thread_pointer->state = NEW;

	/* initialize the thread's stack */
	tmp_ptr = thread_pointer->stack_pointer;
	tmp_ptr[18] = (unsigned int) mythread; // ea
	tmp_ptr[17] = 1; // estatus
	tmp_ptr[5] = tid; // r4
	tmp_ptr[0] = (unsigned int) mythread_cleanup; // ra
	tmp_ptr[-1] = (unsigned int) (thread_pointer->stack + stack_size); // fp

	return thread_pointer;
}

/* NEW ----> READY */
void mythread_start(tcb *thread_pointer) {
	// assert(thread_pointer && thread_pointer->state == NEW);
	thread_pointer->state = READY;
}

/* READY --push into--> readyQ */
void mythread_join(tcb *thread_pointer) {
	// assert(thread_pointer && thread_pointer->state == READY);
	enqueue((void *) thread_pointer);
}

/* RUNNING ----> BLOCKED */
void mythread_block(tcb *thread_pointer) {
	// assert(thread_pointer && thread_pointer->state == RUNNING);
	thread_pointer->state = BLOCKED;
}

/* RUNNING ----> TERMINATED */
void mythread_terminate(tcb *thread_pointer) {
	// assert(thread_pointer && thread_pointer->state == RUNNING);
	thread_pointer->state = TERMINATED;
}

//Global control block and queue
void producer(int tid) {
	int tem;
	int n;
	int j;
	n = (tid < 6) ? 10 : 15;
	for (tem = 0; tem < n; tem++) {
		mysem_down(empty);
		mysem_down(mutex);
		insert_item(tem);
		mysem_up(mutex);
		mysem_up(full);

	}
}
void consumer(int tid) {
	int tem;
	int n;
	int j;
	n = (tid < 6) ? 10 : 15;
	for (tem = 0; tem < n; tem++) {
		mysem_down(full);
		mysem_down(mutex);
		insert_item(tem);
		mysem_up(mutex);
		mysem_up(empty);

	}
}
void insert_item(int i) {
	current_remove_pointer = current_remove_pointer % size_of_buffer;
	buffer[current_remove_pointer] = 'x';
	current_remove_pointer++;
	printf(
			"thread=%d has produced %d x. the current buffer size after producing: %d\n",
			current_running_thread->tid, i + 1, size_of_buffer);
}
void remove_item(int i) {
	current_remove_pointer = current_remove_pointer % size_of_buffer;
	buffer[current_remove_pointer] = ' ';
	current_remove_pointer++;
	printf(
			"thread=%d has consumed %d x. the current buffer size after producing: %d\n",
			current_running_thread->tid, i + 1, size_of_buffer);
}

void initialize(TCBQueue *emptyQueue) {
	emptyQueue->count = 0;
	emptyQueue->front = 0;

}
tcb * my_dequeue(mysem_t *sem) {
	TCBQueue *q = sem->block_Queue;
	tcb *x;

	x = q->items[q->front];
	int i;
	for (i = 0; i < q->count; i++) {
		q->items[i] = q->items[i + 1];
	}
	q->count = q->count - 1;
	sem->block_Queue->count = sem->block_Queue->count - 1;
	return x;
}

void my_enqueue(mysem_t *sem, tcb *x) {
	TCBQueue *q = sem->block_Queue;
	if (q->count == num_threads) {
		alt_printf("%d is not inserted. Queue is " "full.\n", x);
	} else {
		q->items[q->count] = x;
		q->count = q->count + 1;
	}
	sem->block_Queue = q;
}

int my_queue_has(mysem_t *sem, tcb *x) {
	int i;
	for (i = 0; i < sem->block_Queue->count; i++) {
		if (sem->block_Queue->items[i] = x) {
			return 1;
		}
	}
	return 0;
}

// this is how I create a sem, value is this sem's value, num is for distinguish sems.
mysem_t * mysem_create(int value, int num) {

	mysem_t *new_sem = (mysem_t *) malloc(sizeof(mysem_t));
	TCBQueue *new_queue = (TCBQueue *) malloc(sizeof(TCBQueue));
	new_sem->block_Queue = new_queue;
	initialize(new_sem->block_Queue);
	new_sem->value = value;
	new_sem->num = num;
	return new_sem;

}

// I used this method to create these three sems and initialze some integer.
void ini() {
	mutex = mysem_create(1, 1);
	empty = mysem_create(8, 2);
	full = mysem_create(0, 3);
	size_of_buffer = 8;
	current_remove_pointer = 0;
	current_insert_pointer = 0;
	num_threads = 12;

}
//in this method, i increased this sem
void mysem_up(mysem_t *sem) {
	DISABLE_INTERRUPTS();
	if (mysem_waitCount(sem)>0) {
		sem->block_Queue->count--;
		tcb *released_thread = my_dequeue(sem);
		released_thread->state = READY;
		printf("thread=%d is released by thread=%d on semaphore=%d.\n",
				released_thread->tid, current_running_thread->tid, sem->num);

	}
		sem->value++;

	ENABLE_INTERRUPTS();
}
// in this method, I decreased this sem
void mysem_down(mysem_t *sem) {

	 while (sem->value ==0){
		 DISABLE_INTERRUPTS();
		sem->block_Queue->count++;
		current_running_thread->state = BLOCKED;
		my_enqueue(sem, current_running_thread);
		ENABLE_INTERRUPTS();
		printf("count%d.\n", sem->block_Queue->count);
		int i=0;
		while(current_running_thread->state == BLOCKED){
			printf("thread=%d is blocked on semaphore=%d.\n",
						current_running_thread->tid, sem->num);
				for(i=0;i<200000;i++){}
		}

	 }
		if (sem->value > 0) {
				sem->value--;
		}
	ENABLE_INTERRUPTS();
}

void mysem_delete(mysem_t *sem) {
	free(sem->block_Queue);
	free(sem);
}
int mysem_waitCount(mysem_t *sem) {
	return sem->block_Queue->count;
}
int mysem_value(mysem_t *sem) {
	return sem->value;
}
void *mythread_schedule(void *context) {
	if (getQsize() > 0) {
		if (current_running_thread != NULL) {
			// assert(current_running_thread->state == RUNNING);
			// assert(main_stack_pointer != NULL);
			current_running_thread->state = READY;
			current_running_thread->stack_pointer = (unsigned int *) context;
			enqueue(current_running_thread);
		} else if (main_stack_pointer == NULL) {
			main_stack_pointer = (unsigned int *) context;
		}

		current_running_thread = (tcb *) dequeue();
		// assert(current_running_thread->state == READY);
		current_running_thread->state = RUNNING;

		context = (void *) (current_running_thread->stack_pointer);
	} else if (current_running_thread == NULL && main_stack_pointer != NULL) {
		context = (void *) main_stack_pointer;
	}

	return context;
}

unsigned int mythread_isQempty() {
	return (getQsize() == 0) && (current_running_thread == NULL);
}

void mythread_cleanup() {
	DISABLE_INTERRUPTS();
	mythread_terminate(current_running_thread);
	free(current_running_thread->stack);
	free(current_running_thread);
	mysem_delete(mutex);
	mysem_delete(full);
	mysem_delete(empty);
	current_running_thread = NULL;
	ENABLE_INTERRUPTS();
	while (1)
		;
}
