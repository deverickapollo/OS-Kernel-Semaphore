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
		
	
	
		pthread_create(&producerThread1,NULL, producer,NULL);
		pthread_create(&consumerThread1,NULL, consumer,NULL);
		
		pthread_create(&producerThread2,NULL, producer,NULL);
		pthread_create(&consumerThread2,NULL, consumer,NULL);
		
		pthread_create(&producerThread3,NULL, producer,NULL);
		pthread_create(&consumerThread3,NULL, consumer,NULL);
		
		pthread_create(&producerThread4,NULL, producer,NULL);
		pthread_create(&consumerThread4,NULL, consumer,NULL);
		
		pthread_create(&producerThread5,NULL, producer,NULL);
		pthread_create(&consumerThread5,NULL, consumer,NULL);
		
		pthread_create(&producerThread6,NULL, producer,NULL);
		pthread_create(&consumerThread6,NULL, consumer,NULL);
		
		pthread_create(&producerThread7,NULL, producer,NULL);
		pthread_create(&consumerThread7,NULL, consumer,NULL);
		
		pthread_create(&producerThread8,NULL, producer,NULL);
		pthread_create(&consumerThread8,NULL, consumer,NULL);
		
		pthread_create(&producerThread9,NULL, producer,NULL);
		pthread_create(&consumerThread9,NULL, consumer,NULL);
		
		pthread_create(&producerThread10,NULL, producer,NULL);
		pthread_create(&consumerThread10,NULL, consumer,NULL);
		
		
	
		
		
	
		
		
		
		
		    
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
 char generate_random_alphabet()
{
	char randomLetter = "abCeDfRwAqaQdsSgGhHyYtTrRIiOoPlLpMmNnBbVvcCXxzZ"[random () % 47];
	return randomLetter;
}

void consumer()  //add more parameters as needed
{
	char result;
	while(1){
			result = mon_remove();
			consumer_item;
		}
}