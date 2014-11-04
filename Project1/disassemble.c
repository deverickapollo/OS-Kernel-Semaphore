#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void mythread(int thread_id){
    //the declaration of j as an integer was added on 10/24/2011
    int i, j , n=0;
    int MAX =5;
    n=(thread_id % 2 ==0)? 10:15;
    for(i=0;i<n; i++){
        printf("This is message %d of thread #%d.\n", i, thread_id);
        for (j = 0; j < MAX; j++);
    }
}