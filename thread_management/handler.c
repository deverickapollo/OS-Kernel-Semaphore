#include <stdio.h>
#include <stdlib.h>

struct thread_control_block(){
	int size
	int  thread_id;
	u32_t scheduling_status;
	(int*) malloc(sizeof(size)) context;
}



void mythread_create(int thread_id){
	int i, j , n=0;
	n=(thread_id % 2 ==0)? 10:15;
	for(i=0;i<n; i++){
         printf[1](“This is message %d of thread #%d.\n”, i, thread_id);
         for (j = 0; j < MAX; j++);
	}
}


int mythread_join(){



return 0;
} 