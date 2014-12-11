#include <stdio.h>

#include "alarm_handler.h"
#include "thread_handler.h"

#define NUM_THREADS 8

/* a delay time used to adjust the frequency of printf messages */
#define MAX 1000000

void mythread(unsigned int tid)
{
    unsigned int i, j, n;
    
    n = (tid % 2 == 0)? 10: 15;
    for(i = 0; i < n; i++)
    {
        printf("This is message %d of thread #%d.\n", i, tid);
        for(j = 0; j < (tid%3+1)*MAX; j++);
        // for (j = 0; j < MAX; j++);
    }
}

void os_primitive()
{
    unsigned int i;
    tcb *thread_pointer;
    
    for (i = 0; i < NUM_THREADS; i++)
    {
        thread_pointer = mythread_create(i, 4096, mythread);   // 4B * 4096 entries = 16KB
        mythread_start(thread_pointer);
        mythread_join(thread_pointer);
    }
    
    if ( start_alarm_succeed() )
        printf ("Start the alarm successfully\n");
    else
        printf ("Unable to start the alarm\n");
    
    /* an endless while loop */
    while (1)
    {
        printf ("This is the OS primitive for my exciting CSE351 course projects!\n");
        
        /* delay printf for a while */
        for (i = 0; i < 10*MAX; i++);
    }
}

int main()
{
    os_primitive();
    return 0;
}
