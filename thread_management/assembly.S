.section .exceptions.exit.user, "xa"


call checkFlag

beq r2, r0, done		#if not equal continue else branch to done

	call resetFlag
	mov r4, sp
	call mythread_scheduler
	stw  fp, -4(sp)			# storing frame pointer				
	mov  sp, r2				#restore sp		
	ldw  fp, -4(sp)			#loading new frame pointer 
	
done:
	

