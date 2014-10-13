#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>



void *producer();
void *consumer();

	
void main(void)
{
		//any functions you think necessay
		pthread_t producerThread0;
		pthread_t producerThread1;
		pthread_t producerThread2;
		pthread_t producerThread3;
		pthread_t producerThread4;
		pthread_t producerThread5;
		pthread_t producerThread6;
		pthread_t producerThread7;
		pthread_t producerThread8;
		pthread_t producerThread9;
		pthread_t producerThread10;
		
		pthread_t consumerThread0;
		pthread_t consumerThread1;
		pthread_t consumerThread2;
		pthread_t consumerThread3;
		pthread_t consumerThread4;
		pthread_t consumerThread5;
		pthread_t consumerThread6;
		pthread_t consumerThread7;
		pthread_t consumerThread8;
		pthread_t consumerThread9;
		pthread_t consumerThread10;
		
		sem_init(&producerThread0,NULL,producer,0);
		sem_init(&producerThread1,NULL,producer,0);
		sem_init(&producerThread2,NULL,producer,0);
		sem_init(&producerThread3,NULL,producer,0);
		sem_init(&producerThread4,NULL,producer,0);
		sem_init(&producerThread5,NULL,producer,0);
		sem_init(&producerThread6,NULL,producer,0);
		sem_init(&producerThread7,NULL,producer,0);
		sem_init(&producerThread8,NULL,producer,0);
		sem_init(&producerThread9,NULL,producer,0);
		sem_init(&producerThread10,NULL,producer,0);
		
		sem_init(&consumerThread1,NULL,producer,N);
		sem_init(&consumerThread2,NULL,producer,N);
		sem_init(&consumerThread3,NULL,producer,N);
		sem_init(&consumerThread4,NULL,producer,N);
		sem_init(&consumerThread5,NULL,producer,N);
		sem_init(&consumerThread6,NULL,producer,N);
		sem_init(&consumerThread7,NULL,producer,N);
		sem_init(&consumerThread8,NULL,producer,N);
		sem_init(&consumerThread9,NULL,producer,N);
		sem_init(&consumerThread10,NULL,producer,N);
	
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
		pthread_create(&producerThread0,NULL, producer,NULL);
	
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		    
		pthread_create(&thread[i],NULL, producer,NULL);
		for(i=0;i<NUMBER_OF_PROCS;I++){
			if((i%2)==0)
					pthread_create(&thread[i],NULL, producer,NULL);
			else
					pthread_create(&thread[i],NULL, consumer,NULL);
		}
		//create ten producer threads
		//create ten consumer threads
}

void producer() //add more parameters as needed
{
	char alpha;
	while(1) {
		alpha=generate_random_alphabet();
		mon_insert(alpha);
		}
}

void consumer()  //add more parameters as needed
{
	char result;
	while(1){
			result = mon_remove();
			consumer_item;
		}
}