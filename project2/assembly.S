.section .exceptions.exit.user, "xa"


call checkFlag

beq r2, r0, done		#if global_flag is not set br to Done otherwise continue

	call resetFlag		#resetting the flag for the next call
	mov r4, sp			#Saving the current Stack pointer on the regster for later use
	call mythread_scheduler	#swtiching thread contexts to continue execution
	stw  fp, -4(sp)			# storing frame pointer	of the stack
	mov  sp, r2				# restore sp
	ldw  fp, -4(sp)			#loading new frame pointer 
	
done:
	

