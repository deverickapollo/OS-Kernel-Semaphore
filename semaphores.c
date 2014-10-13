/*Semaphors and Monitors
 *By Deverick Simpson and Yuektan
 */

#include<stdio.h>

int main(int argc, char **argv){
	char buff[512];
	if(argc<2)
	{
		printf('Usage: %s \n',argv[0]);
		exit(0);
	}
	strcpy(buff, argv[1]);
	printf('Your name: %s\n',buff);
	return 0;
}


