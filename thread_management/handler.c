#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/alt_alarm.h>
#include "alt_types.h"

#define ALARMTICKS(x) ((alt_ticks_per_second()*(x))/10) //second intervals
alt_alarm alarm;

 unsigned int x = 10;			//This value defines the paramater for ALARMTICKS(10)
 unsigned int MAX = 100000;
 unsigned int global_flag=0;		// 1 means timer interrupt 0 not
 unsigned int num_threads=8;  //This defines the max number of current threads possible

typedef struct {
	unsigned int thread_id;
	unsigned int scheduling_status;			//..Running-1, Ready-2, waiting-3, start-4, done-5
	unsigned int stack_size;
	unsigned int context_pointer;

	int stack;
}ThreadControlBlock;

typedef struct{
	int front;
    int rear;
    int count;
    ThreadControlBlock* items[8];
}TCBQueue;

//Global control block and queue
ThreadControlBlock *tempThread;
TCBQueue mainThreadQueue;


void initialize(TCBQueue emptyQueue){
	emptyQueue.count =0;
	emptyQueue.front = 0;
	emptyQueue.rear = -1;
}


 // disable an interrupt
 #define DISABLE_INTERRUPTS() {  \
     asm("wrctl status, zero");  \
 }
 
 // enable an interrupt
 #define ENABLE_INTERRUPTS() {   \
   asm("movi et, 1");          \
   asm("wrctl status, et");    \
 }

void resetFlag(){
	global_flag = 0;

}

void setFlag(){
		global_flag = 1;
		printf("Global flag in setFlag = %d\n", global_flag);

}

unsigned int checkFlag(){
		//returning new .context_pointer...where is it going?
	//printf("Global flag in checkFlag = %d\n", global_flag);
		return global_flag;
}

void cleanup(){
	 DISABLE_INTERRUPTS();
	 	 
	 
	 ENABLE_INTERRUPTS();
}


ThreadControlBlock *dequeue(){
	TCBQueue q = mainThreadQueue;
    ThreadControlBlock *x;
    q.count=q.count-1;
    x= q.items[q.front];
    q.front=(q.front+1)%num_threads;
	mainThreadQueue.count = mainThreadQueue.count -1 ;
    return x;
}


void enqueue(ThreadControlBlock *x){
	TCBQueue q = mainThreadQueue;
    if(q.count == num_threads){
        alt_printf("%d is not inserted. Queue is " "full.\n",x);
    }else if(q.count == 0){
    	 q.count = q.count+1;
    	 q.rear = (q.rear+1) % num_threads;
         q.items[q.rear-1]= x;
         mainThreadQueue = q;
	}
    else{
        q.count = q.count+1;
        q.rear = (q.rear+1) % num_threads;
        q.items[q.rear-1]=x;
        mainThreadQueue = q;
    }
}

//Complete. This will be the running thread
void mythread(int thread_id){
    //the declaration of j as an integer was added on 10/24/2011
    int i, j , n=0;
    n=(thread_id % 2 ==0)? 10:15;
    for(i=0;i<n; i++){
        alt_printf("This is message %d of thread #%d.\n", i, thread_id); //Whats with the printf array
        for (j = 0; j < MAX; j++);
    }
}


//Create 8 threads 
ThreadControlBlock *mythread_create(int thread_id, int stackSize, void (*mythread)(unsigned int thread_id)){
	//So here is where we will store the stack contents from the context_pointer
	//typecast the context_pointer to an integer arraylist. Store the offset from..such as, context_pointer[4]

	//Initializing the ThreadControlBlock properties
	unsigned int *localStack;
	ThreadControlBlock *threadTest=(ThreadControlBlock *)malloc(sizeof(ThreadControlBlock));
	threadTest->thread_id = thread_id;
	threadTest->scheduling_status = 3;
	threadTest->stack_size = stackSize;
	threadTest->stack = (char*)malloc(stackSize);  //probably should not use
	threadTest->context_pointer =  (char*)threadTest->stack + stackSize - 76;	 //The address location of the context_pointer. aka stack pointer...RA


	//Create Stack and save sp
	localStack =  (unsigned int*)threadTest->context_pointer;			//new context pointer
	localStack[0] = (int)cleanup;		//
	localStack[5] =thread_id;			//Thread ID
	localStack[17] = 1;					//
	localStack[18] = (unsigned int)mythread;		//pointing to the mythread function
	localStack[-1] =threadTest->stack + threadTest->stack_size; 		//frame pointer
	//printf("frame pointer%d\n",localStack);
	printf("Currnt thread %p,%p\n",threadTest->stack, localStack[-1]);
	return threadTest;
}

//Suspend main thread
  //Place in queue
void mythread_join(ThreadControlBlock *thread){

     enqueue(thread);
}

alt_u32 mythread_handler(void * context){
	//The global flag is used to indicate a timer interrupt
	setFlag();
	//printf("Global flag after setFlag = %d\n", global_flag);
	//printf("Global flag in mythreadHandler = %d\n", checkFlag());
	alt_printf("Interrupted by the mythread handler!\n");
	return ALARMTICKS(x)*4;
}


void prototype_os()
{
	//thread initialized on creation..I want to bring back the initialize function
 	ThreadControlBlock *newThread;
 	initialize(mainThreadQueue);
 	int i,j;
  for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_create so that the TCB for each thread is created    
         //assembly calls
         newThread = mythread_create(i, 4096, mythread);
         // Here: call mythread_join to make each thread runnable/ready
         mythread_join(newThread);
     }
     // Here: initialize the timer and its interrupt handler as is done in Project I
	 alt_alarm_start(&alarm,ALARMTICKS(x)*4, mythread_handler, NULL);

     while (1)
     {
        alt_printf ("This is the OS prototype for my exciting CSE351 course projects!\n");
        for (j = 0 ; j < MAX; j++);
     }
}

//If there are still ready threads in the run queue
//conditional flag checking of interrupt is from timer or not 
//current sp passing in as a parameter
//Here do whatever you need.
//what is going on with the stack pointer
//called from assembly file 

void *mythread_scheduler(void *context){
		//Preserve context and restore that of the next to be execeuted
		//Perform thread scheduling

	alt_printf("Am I getting here!\n");
	if(mainThreadQueue.count > 0){
		tempThread->context_pointer = (unsigned int*)context;
		enqueue(tempThread);
		tempThread=dequeue();
		//Return the new thread stack pointer...when returning please access the .context_pointer property	
	}else{
		alt_printf("Interrupted by the DE2 timer!\n");
	}
	
	
	return (void *)tempThread->context_pointer;

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

