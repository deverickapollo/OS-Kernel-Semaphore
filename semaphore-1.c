//Library Declarations
#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <pthread.h>
#include<string.h>
#define N 10000000
int buffer_item[N];

typedef struct{
	int *ary;
	int count;
	int max;
	//Instantiate bounds 
	sem_t mutex;
	sem_t empty;
	sem_t full;
} buffer_stack;


buffer_stack newStack;

void *producer();
void *consumer();
void init_stack();

void main (void){
// create four producer threads
// create four consumer threads
	init_stack(&newStack,N);
	pthread_t thread0;
	pthread_t thread1;
	pthread_t thread2;
	pthread_t thread3;
	pthread_t thread4;
	pthread_t thread5;
	pthread_t thread6;
	pthread_t thread7;
	

	pthread_create(&thread0,NULL,(void*)producer,NULL);
	pthread_create(&thread1,NULL,(void*)producer,NULL);
	pthread_create(&thread2,NULL,(void*)producer,NULL);
	pthread_create(&thread3,NULL,(void*)producer,NULL);
	pthread_create(&thread4,NULL,(void*)consumer,NULL);
	pthread_create(&thread5,NULL,(void*)consumer,NULL);
	pthread_create(&thread6,NULL,(void*)consumer,NULL);
	pthread_create(&thread7,NULL,(void*)consumer,NULL);
	
	pthread_join(thread0,NULL);
	pthread_join(thread1,NULL);
	pthread_join(thread2,NULL);
	pthread_join(thread3,NULL);
	pthread_join(thread4,NULL);
	pthread_join(thread5,NULL);
	pthread_join(thread6,NULL);
	pthread_join(thread7,NULL);
	
	exit(0);
}
void init_stack(buffer_stack *newStack, int elements){
	newStack -> ary = buffer_item;
	newStack-> count =0;
	newStack->max = elements;
	sem_init(&newStack->mutex,0,1);
	sem_init(&newStack->empty,0,N);
	sem_init(&newStack->full,0,0);
}


int insert_item(buffer_stack *newStack, char character){
	if(newStack->count<newStack->max){
		newStack->ary[newStack->count] = character;
		newStack->count++;
		return 0;
	}else{ return -1;}
}

int remove_item(buffer_stack *newStack, char character){
	if(newStack->count>0){
		newStack->count--;
		character = newStack->ary[newStack->count];
		return 0;
	}else{return -1;}
}

void *producer (void *p){
	while (1) {
		sem_wait(&newStack.empty) ;
			sem_wait(&newStack.mutex) ;
		// insert X to the first available slot in the buffer
			insert_item(&newStack,'X');
	        sem_post(&newStack.mutex); 
		sem_post(&newStack.full);
	}
}

void *consumer (void *p){
	while (1) {
		sem_wait(&newStack.full); 
			sem_wait(&newStack.mutex) ;
		// remove X from the last used slot in the buffer
				remove_item(&newStack, 'X');
			sem_post(&newStack.mutex); 
		sem_post(&newStack.empty);
	}
}