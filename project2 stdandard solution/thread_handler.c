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
static tcb *current_running_thread      = NULL;

/* pointing to the stack/context of main() */
static unsigned int *main_stack_pointer = NULL;

mysem_t mutex;
mysem_t empty;
mysem_t full;
tcb *mythread_create(unsigned int tid, unsigned int stack_size, void (*mythread)(unsigned int tid))
{
    unsigned int *tmp_ptr;
    
    /* allocate a tcb for a thread */
    tcb *thread_pointer;
    
    thread_pointer                      = (tcb *)malloc(sizeof(tcb));
    if (thread_pointer == NULL)
    {
        printf("Unable to allocate space!\n");
        exit(1);
    }
    
    /* initialize the thread's tcb */
    thread_pointer->tid                 = tid;
    thread_pointer->stack               = (unsigned int *)malloc(sizeof(unsigned int) * stack_size);
    if (thread_pointer->stack == NULL)
    {
        printf("Unable to allocate space!\n");
        exit(1);
    }
    thread_pointer->stack_size          = stack_size;
    thread_pointer->stack_pointer       = (unsigned int *)(thread_pointer->stack + stack_size - 19);
    thread_pointer->state               = NEW;
    
    /* initialize the thread's stack */
    tmp_ptr                             = thread_pointer->stack_pointer;
    tmp_ptr[18]                         = (unsigned int)mythread;                               // ea
    tmp_ptr[17]                         = 1;                                                    // estatus
    tmp_ptr[5]                          = tid;                                                  // r4
    tmp_ptr[0]                          = (unsigned int)mythread_cleanup;                       // ra
    tmp_ptr[-1]                         = (unsigned int)(thread_pointer->stack + stack_size);   // fp
           
    return thread_pointer;
}

/* NEW ----> READY */
void mythread_start(tcb *thread_pointer)
{
    // assert(thread_pointer && thread_pointer->state == NEW);
    thread_pointer->state = READY;
}

/* READY --push into--> readyQ */
void mythread_join(tcb *thread_pointer)
{
    // assert(thread_pointer && thread_pointer->state == READY);
    enqueue((void *)thread_pointer);
}

/* RUNNING ----> BLOCKED */
void mythread_block(tcb *thread_pointer)
{
    // assert(thread_pointer && thread_pointer->state == RUNNING);
    thread_pointer->state = BLOCKED;
}

/* RUNNING ----> TERMINATED */
void mythread_terminate(tcb *thread_pointer)
{
    // assert(thread_pointer && thread_pointer->state == RUNNING);
    thread_pointer->state = TERMINATED;
}
typedef struct{
    int front;
    int count;
    ThreadControlBlock* items[12];
}TCBQueue;

//Global control block and queue
void produce(int tid){
	int i,j,n;
	n=(tid<6)?10:15;
	for(int i=0;i<n;i++){
	 mysem_wait(empty);
	 mysem_wait(mutex);
	 insert_item(item);
	 mysem_up(&mutex);
	 mysem_up(&full);
	}
}
void consumer(){
	int item;
	while(1){
	mysem_down(&full);
	mysem_down(&mutex);
	item = remove_item();
	mysem_up(&mutex);
	mysem_up(&empty);
	consume_item(item);
	}
}
void insert_item(int i){

}
void remove_item(int i){

}

void initialize(TCBQueue emptyQueue){
    emptyQueue.count =0;
    emptyQueue.front = 0;
    emptyQueue.rear = -1;
}
ThreadControlBlock *dequeue(mysem_t sem){
    TCBQueue q = sem->blocked_Queue;
    ThreadControlBlock *x;

    x= q.items[q.front];
	int i;
	for(i=0;i<q.count;i++){
	q.item[i]=q.item[i+1];
	}
	q.count=q.count-1;
   
    sem->blocked_Queue.count = sem->blocked_Queue.count -1 ;
    return x;
}


void enqueue(mysem_t sem,ThreadControlBlock *x){
    TCBQueue q = sem->blocked_Queue;
    if(q.count == num_threads){
        alt_printf("%d is not inserted. Queue is " "full.\n",x);
    }else {
	q.item[q.count]=x;
	q.count=q.count+1;
	}
	sem->blocked_Queue = q;
}
typedef struct
{
    int value;
    TCBQueue block_Queue;
    int num;
}mysem_t;

mysem_t mysem_create(int value, int num)
{
    mysem_t new_sem = (mysem_t *)malloc(sizeof(mysem_t));
    TCBQueue new_queue =(TCBQueue *)malloc(sizeof(TCBQueue));
    mysem_t->block_Queue = new_queue;
    new_sem->value=value;
    new_sem->num=num;
    return new_sem;
    
}


void mysem_up(mysem_t sem){
    DISABLE_INTERRUPTS();
    if(sem->block_Queue->count){
        tcb released_thread = dequeue(sem->block_Queue);
        released_thread->state=READY;
        printf("thread=%d is released by thread=%d on semaphore=%d.\n",released_thread->tid,current_running_thread->tid,sem->num);
    }
    else
    {
        sem->value++;
    }
    ENABLE_INTERRUPTS();
    
}


void mysem_down(mysem_t sem){
    DISABLE_INTERRUPTS();
    if(sem->value>0)
    {
        sem->value--;
    }
    else
    {
        printf("thread=%d is blocked on semaphore=%d.\n",current_running_thread->tid,sem->num);
        current_running_thread->state = BLOCKED;
        do
        {
            DISABLE_INTERRUPTS();
            if(sem->value>0)
            {
                break;
            }
            ENABLE_INTERRUPTS();
        }while(1);
    }
    ENABLE_INTERRUPTS();
}

void mysem_delete(mysem_t sem){
    free(sem->blocked_queue);
	free(sem);
}
int mysem_waitCount(mysem_t sem){
    return sem->blocked_Queue->count;
}
int mysem_value(){
    return sem->value;
}
void *mythread_schedule(void *context)
{
    if (getQsize() > 0)
    {
        if (current_running_thread != NULL)
        {
            // assert(current_running_thread->state == RUNNING);
            // assert(main_stack_pointer != NULL);
            current_running_thread->state = READY;
            current_running_thread->stack_pointer = (unsigned int *)context;
            enqueue(current_running_thread);
        }
        else if (main_stack_pointer == NULL)
        {
            main_stack_pointer = (unsigned int *)context;
        }
        
        current_running_thread = (tcb *)dequeue();
        // assert(current_running_thread->state == READY);
        current_running_thread->state = RUNNING;
        
        context = (void *)(current_running_thread->stack_pointer);
    }
    else if (current_running_thread==NULL && main_stack_pointer!=NULL)
    {        
        context = (void *)main_stack_pointer;
    }

    return context;
}

unsigned int mythread_isQempty()
{
    return (getQsize() == 0) && (current_running_thread == NULL);
}

void mythread_cleanup()
{
    DISABLE_INTERRUPTS();
    mythread_terminate(current_running_thread);
    free(current_running_thread->stack);
    free(current_running_thread);
    current_running_thread = NULL;
    ENABLE_INTERRUPTS();
    while(1);
}
