#include <stddef.h>
#include <stdio.h>
#include "sys/alt_alarm.h"
#include "alt_types.h"

#define ALARMTICKS(x) ((alt_ticks_per_second()*(x))/10)
alt_alarm alarm;

int main(){
	prototype_os();
}

alt_u32 myinterrupt_handler (void * context){
	alt_printf("Interrupted by the handler!\n");
	return ALARMTICKS(10);
}

prototype_os(){
	int j;
	int MAX = 65535;
	alt_alarm_start(&alarm, ALARMTICKS(10), myinterrupt_handler, NULL);
	while(1){
		alt_printf("This is the prototype OS for my exciting CSE351 course projects!\n");
		// Here: think about what MAX is used for. Pick up an appropriate value for it experimentally.
		for (j = 0 ; j < MAX; j++);
	}
}