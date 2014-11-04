#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>


void destroyEntry(char entry)
{
    free(entry);
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
struct TCBQueue{
    struct int front;
    struct int rear;
    int count;
    ThreadControlBlock items[max];
};
void initialize(struct queue q){
    q->count=0;
    q->front=NULL;
    q->rear=NULL;
}
pthread_t dequeue(struct queue *q){
    ThreadControlBlock x;
    q->count=q->count-1;
    x=q->items[front];
    q->front=(q->front+1)%max;
    return x;
}
void enqueue(struct queue *q,ThreadControlBlock x){
    if(q->count==max){
        printf("%d is not inserted. Queue is " "full.\n",x);
    }else{
        q->count = q->count+1;
        q->rear = (q->rear+1) % max;
        q->items[rear]=x;
    }
}
typedef struct {
	int size;
	int  thread_id;
	int scheduling_status;
	(int*) malloc(size) context;
}ThreadControlBlock;

//is this the way to create a thread, don't we need to use pthread_create function?
//Create 8 threads 
void mythread_create(pthread_t thread){
	pthread_create(&thread,NULL,(void*)ThreadControlBlock,NULL);
}


//Suspend main thread
void mythread_join(pthread_t thread){
    (void) pthread_join(thread,NULL);
    return 0;
}

void mythread(){
    //the declaration of j as an integer was added on 10/24/2011
    int i, j , n=0;
    n=(thread_id % 2 ==0)? 10:15;
    for(i=0;i<n; i++){
        printf[1]("This is message %d of thread #%d.\n", i, thread_id);
        for (j = 0; j < MAX; j++);
    }
}



//need to complete another test
// are we going to call schedule in protoType_os?

void prototype_os(thread arrauy, at array, st array)
 {
     int num_threads=8;
     
     for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_create so that the TCB for each thread is created
         // Here: do whatever you need
         //assembly calls
         mythread_create(someArryOfThreads[i]);
              }
     for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_join to make each thread runnable/ready
         // Here: do whatever you need
         mythread_join(someArryOfThreads[i]);
     }
     // Here: initialize the timer and its interrupt handler as is done in Project I
     while (true)
     {
         alt_printf ("This is the OS prototype for my exciting CSE351 course projects!\n");
	int MAX = 5;

         for (j = 0 ; j < MAX; j++);
     }
}
 
 

alt_u32 mythread_handler(void *param_list){
	//The global flag is used to indicate a timer interrupt
	global_flag = 1;
	return ALARMTICKS(QUANTUM_LENGTH);
}

//we need to parse in a arrive time list and a sevice time list, also should we just define the time slice as 1?
mythread_scheduler(thread array, at array, st array){
    
//Here do whatever you need.
//If there are still ready threads in the run queue

	if(){
		//Perform thread scheduling
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
        pthread_t threadArray;
        // create a queue, create 8 threads and store them into the queue
        int at,st;;
        at=new int[8];
        st=new int[8];
        for(i=0;i<n;i++)
        {
            printf("Enter arrival time and sevice time for Process P%d :",i+1);
            scanf("%d",&at[i]);
            scanf("%d",&st[i]);            
        }
		//Calling prototype OS
		prototype_os(threadArray,at,st);
        
		return 0;
	}
} 
