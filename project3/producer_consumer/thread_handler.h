/* 
    Name:   thread_handler.h
    Author: Dongyuan Zhan
    Date:   11/20/2010
Description:
    Functions used to manage threads
*/

/* possible thread states */
enum tstate {NEW, READY, RUNNING, BLOCKED, TERMINATED, NUM_TSTATES};

/* thread control block */
typedef struct
{
    unsigned int tid;
    unsigned int *stack;
    unsigned int stack_size;
    unsigned int *stack_pointer;
    enum tstate  state;
} tcb;
typedef struct{
    int front;
    int count;
    tcb * items[12];
}TCBQueue;

typedef struct
{
    int value;
    TCBQueue *block_Queue;
    int num;
}mysem_t;

/* declaration */
tcb *mythread_create(unsigned int tid, unsigned int stack_size, void (*mythread)(unsigned int tid));

void mythread_start(tcb *thread_pointer);

void mythread_join(tcb *thread_pointer);

void mythread_block(tcb *thread_pointer);

void mythread_terminate(tcb *thread_pointer);

void producer(int i);

void consumer();

void insert_item(int i);

void remove_item(int i);

int my_queue_has(mysem_t *sem,tcb *x);



void initialize(TCBQueue *emptyQueue);
tcb *my_dequeue(mysem_t *sem);

void my_enqueue(mysem_t *sem,tcb *x);

mysem_t * mysem_create(int value,int num);

void mysem_up(mysem_t *sem);

void mysem_down(mysem_t *sem);


void mysem_delete(mysem_t *sem);

int mysem_waitCount(mysem_t *sem);

int mysem_value(mysem_t *sem);

void ini();


void *mythread_schedule(void *context);

unsigned int mythread_isQempty();

void mythread_cleanup();
