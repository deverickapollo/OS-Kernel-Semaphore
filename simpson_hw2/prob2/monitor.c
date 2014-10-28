#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <pthread.h>
#define N 10000000

typedef struct{
	int count;
	sem_t someSemaphore;
	sem_init(&someSemaphore,0,1);
}CV;

int count=0;
CV test;

char buf[N];

// add more varibales as necessary
// (e.g. a semaphore to regulate monitor enter and exit)

typedef struct{
	int blockedThread;
	sem_t suspend;	
	sem_init(&suspend,0,1);
	int  count(){
		renturn blockedThread;
	}
	void wait(){
		sem_wait(&suspend);
	}
	void signal(){
		sem_post(&suspend);
	}
}cond;

cond empty;
cond full;

void signal(cond a){

}

void wait(cond b){

}


void mon_insert(char alpha)
{
	while(count == N) wait(full);
	insert_item(alpha);
	count=count+1;
	signal(empty);
}

char mon_remove()
{
	char result;
	while(count == 0) wait(empty);
	result = remove_item();
	count = count-1;
	signal(full);
	return result;
}
void insert_item(char item)
{
	buf[N]=item;
}

char remove_item()
{
   char item;
   item = buf[count];
   return item;	
}

