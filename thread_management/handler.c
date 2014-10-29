#include <stdio.h>
#include <stdlib.h>

struct thread_control_block(){
	int size
	int  thread_id;
	u32_t scheduling_status;
	(int*) malloc(sizeof(size)) context;
}

//is this the way to create a thread, don't we need to use pthread_create function?
//Create 8 threads 
void mythread_create(int thread_id){
	int i, j , n=0;
	n=(thread_id % 2 ==0)? 10:15;
	for(i=0;i<n; i++){
         printf[1](“This is message %d of thread #%d.\n”, i, thread_id);
         for (j = 0; j < MAX; j++);
	}
}

//Suspend main thread
int mythread_join(Pthread thread){
    
    (void) pthread_join(thread,NULL);
    return 0;
	
}

void mythread(){
    //the declaration of j as an integer was added on 10/24/2011
    int i, j , n=0;
    n=(thread_id % 2 ==0)? 10:15;
    for(i=0;i<n; i++){
        printf[1](“This is message %d of thread #%d.\n”, i, thread_id);
        for (j = 0; j < MAX; j++);
    }
}

//need to complete another test
void prototype_os(param_list)
 {
     for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_create so that the TCB for each thread is created
         // Here: do whatever you need
     }
     for (i = 0; i < num_threads; i++)
     {
         // Here: do whatever you need
         // Here: call mythread_join to make each thread runnable/ready
         // Here: do whatever you need
     }
     // Here: initialize the timer and its interrupt handler as is done in Project I
     while (true)
     {
         alt_printf (ÒThis is the OS prototype for my exciting CSE351 course projects!\nÓ);
         for (j = 0 ; j < MAX; j++);
     }
 }
 
 

alt_u32 mythread_handler(void *param_list){
		//The global flag is used to indicate a timer interrupt
		global_flag = 1;
		return ALARMTICKS(QUANTUM_LENGTH);
}

mythread_scheduler(paramm_list){
//Here do whatever you need.
//If there are still ready threads in the run queue
	{
		//Perform thread scheduling
	}else{
		alt_printf("Interrupted by the DE2 timer!\n");
	}
}

return 0;

} 