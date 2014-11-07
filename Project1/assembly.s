//Need to add assembly here

.section .exceptions.exit.user, "xa"

if global_flag is set
	call mythread_schedule
	reset global flag
else
	call original procedure in alt_eception_entry.s