#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sys/alt_alarm.h"
#include "alt_types.h"
#define ALARMTICKS(x) ((alt_ticks_per_second()*(x))/10)
alt_alarm alarm;

int x = 10;			//This value defines the paramater for ALARMTICKS(10)
int MAX = 500000;
int global_flag =0;		// 1 means timer interrupt 0 not
static int num_threads=8;  //This defines the max number of current threads possible
int num_currThreads =0;
int globalFramePointer = 0;


 // disable an interrupt
 #define DISABLE_INTERRUPTS() {  \
     asm("wrctl status, zero");  \
 }
 
 // enable an interrupt
 #define ENABLE_INTERRUPTS() {   \
   asm("movi et, 1");          \
   asm("wrctl status, et");    \
 }
 
struct {
    struct int front;
    struct int rear;
    int count;
    ThreadControlBlock items[num_threads];
}TCBQueue;


void resetFlag(){
	global_flag = 0;
}



void checkFlag(TCBQueue *someQueue){
	if(global_flag==1){
		//returning new .context_pointer...where is it going? 
		mythread_scheduler(someQueue);
		resetFlag();
	} 
}



void cleanup(ThreadControlBlock *killWeirdThread){
	free(killWeirdThread);
}



void initialize(struct queue *q){
    q->count=0;
    q->front=NULL;
    q->rear=NULL;
}


ThreadControlBlock dequeue(struct queue *q){
    ThreadControlBlock x;
    q->count=q->count-1;
    x=q->items[front];
    q->front=(q->front+1)%num_threads;
    --num_currThreads;
    return x;
}



void enqueue(struct queue *q,ThreadControlBlock *x){
    if(q->count==num_threads){
        printf("%d is not inserted. Queue is " "full.\n",x);
    }else{
        q->count = q->count+1;
        q->rear = (q->rear+1) % num_threads;
        q->items[rear]=x;
        ++num_currThreads;
    }
}

typedef struct {
	int  thread_id;
	int scheduling_status;			//..Running-1, Ready-2, waiting-3, start-4, done-5
	int stack_size;
	(int*) malloc(stack_size) context_pointer;
	int frame_pointer;
}ThreadControlBlock;


	
	

//Create 8 threads 
ThreadControlBlock mythread_create(int thread_id, int stackSize){
	//So here is where we will store the stack contents from the context_pointer
	//typecast the context_pointer to an integer arraylist. Store the offset from..such as, context_pointer[4]
	ThreadControlBlock threadTest;	
	threadTest.thread_id = thread_id;
	threadTest.scheduling_status = 3;
	threadTest.stack_size = stackSize; 		

	newStack= malloc(sizeOf(int)*stackSize);
	
	threadTest.context_pointer = *newStack+ stackSize - 19;	 //The address location of the context_pointer. aka stack pointer...RA
	threadTest.frame_pointer = 	threadTest.context_pointer -1;
	
	//Create Stack and save sp
	threadTest.context_pointer + 18 = mythread(thread_id);		//EA Register---mythread
	threadTest.context_pointer + 5 = thread_id; //R4 register for parameters		
	threadTest.context_pointer + 17 = 1;		// eStatus sets the flag for a timer interrupt	
	return threadTest;
}


//Suspend main thread
  //Place in queue
void mythread_join(TCBQueue someThreadQueue, ThreadControlBlock thread){
     enqueue(someThreadQueue, thread);	
}


//Complete. This will be the running thread
void mythread(int thread_id){
    //the declaration of j as an integer was added on 10/24/2011
    int i, j , n=0;
    n=(thread_id % 2 ==0)? 10:15;
    for(i=0;i<n; i++){
        printf[1]("This is message %d of thread #%d.\n", i, thread_id); //Whats with the printf array
        printf("This is message %d of thread #%d.\n", i, thread_id); 
        for (j = 0; j < MAX; j++);
    }
}



void prototype_os()
{
 	TCBQueue threadQueue;
 	initialize(threadQueue);	
  for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_create so that the TCB for each thread is created    
         //assembly calls
         newThread[i] = mythread_create(i, 4096);
     }

	
  for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_join to make each thread runnable/ready
         mythread_join(threadQueue, newThread[i]);
     }
     
     
     // Here: initialize the timer and its interrupt handler as is done in Project I
	 alt_alarm_start(&alarm,ALARMTICKS(x), mythread_handler(), NULL);
	 
     while (true)
     {
         alt_printf ("This is the OS prototype for my exciting CSE351 course projects!\n");
        for (j = 0 ; j < MAX; j++);
     }
}
 
 //R2 will hold stack pointer 

alt_u32 mythread_handler(void *context){
	//The global flag is used to indicate a timer interrupt
	alt_printf("Interrupted by the mythread handler!\n");
	global_flag = 1;
	return ALARMTICKS(x);
}

//If there are still ready threads in the run queue
//conditional flag checking of interrupt is from timer or not 
//current sp passing in as a parameter
//Here do whatever you need.
//what is going on with the stack pointer
//called from assembly file 

ThreadControlBlock.context_pointer mythread_scheduler(TCBQueue someThreadQueue){		
		//Preserve context and restore that of the next to be execeuted
		//Perform thread scheduling			
	if(someThreadQueue.count >0){
		ThreadControlBlock temp=dequeue(sometThreadQueue);
		enqueue(someThreadQueue,temp);
		//Return the new thread stack pointer...when returning please access the .context_pointer property
		return temp.context_pointer;
	}else{
		alt_printf("Interrupted by the DE2 timer!\n");
	}
}



//After creating thread, inject assembly to
// store address space for context while calling next thread
//Need state to block thread in queue.
//ea set in stack space #functionName
//Stack space properties must be initialized..interrupt register to 1..
//before you may run your stack it must be initialized..replication process
//Every thread has its own stack...
//Is there anything above the SP and FP?? probably so save it
//Using malloc for your thread, change sp to be loading for next thread.
//global varibale--is my button coming from timer or from interrupt handler.
//When you come back is when you switch the stack space.

	//main calling function
	int main(void){
		//Calling prototype OS
		prototype_os();
		return 0;
	}
} 
