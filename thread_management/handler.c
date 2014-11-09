#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/alt_alarm.h>

#include "alt_types.h"

#define ALARMTICKS(x) ((alt_ticks_per_second()*(x))/10)
alt_alarm alarm;

int x = 10;			//This value defines the paramater for ALARMTICKS(10)
int MAX = 500000;
int global_flag =0;		// 1 means timer interrupt 0 not
static int num_threads=8;  //This defines the max number of current threads possible
static int stackPointer;




 // disable an interrupt
 #define DISABLE_INTERRUPTS() {  \
     asm("wrctl status, zero");  \
 }
 
 // enable an interrupt
 #define ENABLE_INTERRUPTS() {   \
   asm("movi et, 1");          \
   asm("wrctl status, et");    \
 }


struct{
	int front;
    int rear;
    int count;
    ThreadControlBlock items[num_threads];
}TCBQueue;

TCBQueue mainThreadQueue = NULL;

void resetFlag(){
	global_flag = 0;
}



int checkFlag(){
	if(global_flag==1){
		//returning new .context_pointer...where is it going? 
		resetFlag();
		return 1;
	} else return 0;
}

void cleanup(){
	 DISABLE_INTERRUPTS();
	 	 
	 
	 ENABLE_INTERRUPTS();
}

void initialize(struct queue *q){
    q->count=0;
    q->front=NULL;
    q->rear=NULL;
}

typedef struct {
	int  thread_id;
	int scheduling_status;			//..Running-1, Ready-2, waiting-3, start-4, done-5
	int stack_size;
	(int*) malloc(stack_size) context_pointer;
	int frame_pointer;
	int stack;
}ThreadControlBlock;

ThreadControlBlock tempThread;


ThreadControlBlock dequeue(){
	struct queue *q = *mainThreadQueue;
	--mainThreadQueue.count;
    ThreadControlBlock x;
    q->count=q->count-1;
    x=q->items[front];
    q->front=(q->front+1)%num_threads;
    return x;
}



void enqueue(ThreadControlBlock *x){
	struct queue *q = *mainThreadQueue;
    if(q->count==num_threads){
        printf("%d is not inserted. Queue is " "full.\n",x);
    }else{
        q->count = q->count+1;
        q->rear = (q->rear+1) % num_threads;
        q->items[rear]=x;
        ++mainThreadQueue.count;
    }
}


	

//Create 8 threads 
ThreadControlBlock *mythread_create(int thread_id, int stackSize){
	//So here is where we will store the stack contents from the context_pointer
	//typecast the context_pointer to an integer arraylist. Store the offset from..such as, context_pointer[4]
	ThreadControlBlock *threadTest;	
	threadTest = (tcb *)malloc(sizeof(tcb));
	threadTest -> thread_id = thread_id;
	threadTest.scheduling_status = 3;
	threadTest.stack_size = stackSize; 		
	threadTest.stack = malloc(sizeOf(int)*stackSize);
	
	
	threadTest.context_pointer =  threadTest.stack+ stackSize - 19;	 //The address location of the context_pointer. aka stack pointer...RA
	threadTest.frame_pointer = 	threadTest.context_pointer -1;
	
	
	//Is this an ok way to offsey from context_pointer
	//Create Stack and save sp
	threadTest.context_pointer + 18 = mythread;		//EA Register---mythread
	threadTest.context_pointer + 5 = thread_id; //R4 register for parameters		
	threadTest.context_pointer + 17 = 1;		// eStatus sets the flag for a timer interrupt	
	threadTest.context_pointer - 1 = threadTest.stack + stackSize; //current FP
	return threadTest;
}


//Suspend main thread
  //Place in queue
void mythread_join(ThreadControlBlock thread){
     enqueue(thread);	
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
 	initialize(mainThreadQueue);
 	ThreadControlBlock *newThread;	
 	int i,j;
  for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_create so that the TCB for each thread is created    
         //assembly calls
         newThread = mythread_create(i, 4096);
         // Here: call mythread_join to make each thread runnable/ready
         mythread_join(newThread);
     }
        
     // Here: initialize the timer and its interrupt handler as is done in Project I
	 alt_alarm_start(&alarm,ALARMTICKS(x), mythread_handler, NULL);
	
     while (1)
     {
         alt_printf ("This is the OS prototype for my exciting CSE351 course projects!\n");
        for (j = 0 ; j < MAX; j++);
     }
}


alt_u32 mythread_handler(void * context){
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

void mythread_scheduler(void *context){		
		//Preserve context and restore that of the next to be execeuted
		//Perform thread scheduling			
	if(mainThreadQueue.count >0){
		tempThread.context_pointer = *context;
		enqueue(tempThread);
		tempThread=dequeue();
		//Return the new thread stack pointer...when returning please access the .context_pointer property	
	}else{
		alt_printf("Interrupted by the DE2 timer!\n");
	}
	return tempThread.context_pointer;
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
