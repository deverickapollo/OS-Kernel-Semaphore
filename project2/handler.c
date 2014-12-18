#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/alt_alarm.h>
#include "alt_types.h"

#define ALARMTICKS(x) ((alt_ticks_per_second()*(x))/10) //second intervals
alt_alarm alarm;

unsigned int x = 10; 						//This value defines the paramater for ALARMTICKS(10)
unsigned int MAX = 100000;					//Delay length
unsigned int global_flag = 0; 				// global_flag will determine if interrupt came from timer:::: 1-yes 0-no
unsigned int num_threads = 8; 				//This defines the max number of current threads possible
unsigned int main_context_pointer;

typedef struct {
	unsigned int thread_id;
	unsigned int scheduling_status;			 //::::::Running-1, Ready-2, waiting-3, start-4, done-5
	unsigned int stack_size;
	unsigned int context_pointer;
	int stack;
} ThreadControlBlock;

typedef struct {
	int front;
	int rear;
	int count;
	ThreadControlBlock* items[8];				//Threads held within items
} TCBQueue;




//Global thread control block and queue to hold the current threading processes
ThreadControlBlock *tempThread;
TCBQueue mainThreadQueue;



void initialize(TCBQueue emptyQueue) {
	emptyQueue.count = 0;
	emptyQueue.front = 0;
//	emptyQueue.rear = -1;
}

/*
 * Disabling and enabling of interrrupts necessary for the clean up of the
 * current running thread after completion.  Called within cleanup()
 */
#define DISABLE_INTERRUPTS() {  \
     asm("wrctl status, zero");  \
 }
#define ENABLE_INTERRUPTS() {   \
   asm("movi et, 1");          \
   asm("wrctl status, et");    \
 }



void resetFlag() {
	global_flag = 0;

}

void setFlag() {
	global_flag = 1;
	//printf("Global flag in setFlag = %d\n", global_flag);

}

unsigned int checkFlag() {
	//returning new .context_pointer...where is it going?
	//printf("Global flag in checkFlag = %d\n", global_flag);
	return global_flag;
}

/*
 * cleanup() will free the stack as well as
 * the current running thread before continuing to the next process
 */
void cleanup() {
	DISABLE_INTERRUPTS();
	free(tempThread ->stack);
	free(tempThread);
	tempThread = NULL;
	ENABLE_INTERRUPTS();
}


ThreadControlBlock *dequeue(){
	TCBQueue q = mainThreadQueue;
    ThreadControlBlock *x;

    x= q.items[q.front];
    int i;
    for(i=0;i<q.count;i++){
    	q.items[i]=q.items[i+1];
    }
    q.count=q.count-1;
    mainThreadQueue = q;
    return x;
}


void enqueue(ThreadControlBlock *x){
	TCBQueue q = mainThreadQueue;
    if(q.count == num_threads){
         printf("%d is not inserted. Queue is " "full.\n",x);
    }else{
        q.items[q.count]=x;
        q.count = q.count+1;
    }
    mainThreadQueue = q;
}

/*
 * Provided function that will be used
 * to simulate a running thread within our Prototype Thread Handler
 */
void mythread(int thread_id) {
	int i, j, n = 0;
	n = (thread_id % 2 == 0) ? 10 : 15;
	for (i = 0; i < n; i++) {
		printf("This is message %d of thread #%d.\n", i, thread_id);
		for (j = 0; j < MAX; j++)
			;
	}
}

/*
 * Initialization of the thread control block
 * as well as the stack to contain the information within our thread
 */
ThreadControlBlock *mythread_create(int thread_id, int stackSize,
		void(*mythread)(unsigned int thread_id)) {
	//typecast the context_pointer to an integer arraylist. Store the offset from..such as, context_pointer[4]


	//Initializing the ThreadControlBlock properties
	unsigned int *localStack;
	ThreadControlBlock *threadTest = (ThreadControlBlock *) malloc(sizeof(ThreadControlBlock));
	threadTest->thread_id = thread_id;
	threadTest->scheduling_status = 3;
	threadTest->stack_size = stackSize;
	threadTest->stack = (char*) malloc(stackSize); //probably should not use
	threadTest->context_pointer = (char*) threadTest->stack + stackSize - 76; //The address location of the context_pointer. aka stack pointer...RA


	//Initializing Stack and saving sp
	localStack = (unsigned int*) threadTest->context_pointer; //new context pointer
	localStack[0] = (unsigned int) cleanup; //
	localStack[5] = thread_id; //Thread ID
	localStack[17] = 1; //
	localStack[18] = (unsigned int) mythread; //pointing to the mythread function
	localStack[-1] = threadTest->stack + threadTest->stack_size; //frame pointer
	//printf("frame pointer%d\n",localStack);
	//printf("Currnt thread %p,%p\n",threadTest->stack, localStack[-1]);
	return threadTest;
}


/*
 * mythreadjoin() will place the current created thread on
 * the queue while the main thread is suspended
 */
void mythread_join(ThreadControlBlock *thread) {
	enqueue(thread);
}


/*
 *  Called from alt_alarm_start() within prototype_os
 *  after an indicated time ALARMTICKS(x) has expired
 *
 */
alt_u32 mythread_handler(void * context) {
	setFlag();
	alt_printf("Interrupted by the mythread handler!\n");
	return ALARMTICKS(x);
}

void prototype_os() {

	ThreadControlBlock *newThread;
	initialize(mainThreadQueue);
	int i, j;

	for (i = 0; i < num_threads; i++) {

		// Here: call mythread_create so that the TCB for each thread is created

		newThread = mythread_create(i, 4096, mythread);
		// Here: call mythread_join to make each thread runnable/ready
		mythread_join(newThread);
	}
	// Here: initialize the timer and its interrupt handler as is done in Project I
	alt_alarm_start(&alarm, ALARMTICKS(x), mythread_handler, NULL);

	while (1) {
		alt_printf(
				"This is the OS prototype for my exciting CSE351 course projects!\n");
		for (j = 0; j < MAX; j++);
	}
}

//If there are still ready threads in the run queue
//conditional flag checking of interrupt is from timer or not 
//current sp passing in as a parameter
//Here do whatever you need.
//what is going on with the stack pointer
//called from assembly file 

void *mythread_scheduler(void *context) {
	//Preserve context and restore that of the next to be execeuted
	//Perform thread scheduling
	unsigned int tempPointer;
	//alt_printf("Am I getting here!\n");


	if(main_context_pointer == NULL){
		main_context_pointer = context;
	}



		tempThread ->context_pointer = context;
		enqueue(tempThread);
		tempThread = dequeue();
				tempPointer = tempThread ->context_pointer;



	return tempPointer;
}

/* After creating thread, inject assembly to
 * store address space for context while calling next thread
 * Need state to block thread in queue.
 * ea set in stack space #functionName
 * Stack space properties must be initialized..interrupt register to 1..
 * before you may run your stack it must be initialized..replication process
 * Every thread has its own stack...
 * Is there anything above the SP and FP?? probably so save it
 * Using malloc for your thread, change sp to be loading for next thread.
 * global varibale--is my button coming from timer or from interrupt handler.
 * When you come back is when you switch the stack space.
 */
//main calling function
int main(void) {
	//Calling prototype OS
	prototype_os();
	return 0;
}

