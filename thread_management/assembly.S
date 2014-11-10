.extern checkFlag
.extern resetFlag
.extern mythread_scheduler

.section .exceptions.exit.user, "xa"

call checkFlag			#checkFlag calls resetFlag
mov r4, sp				# save sp to r4 to restore after mythread
addi r10, r0, 1				##temp store for comparison.
beq r2, r10, calling	#thread interrupt has occured
br done					#else head on out


calling:
	call mythread_scheduler
	call resetFlag			#call necessary??, checkFlag calls resetFLag
	stw  fp, -4(sp)			# storing frame pointer				
	mov  sp, r2				#restore sp		
	ldw  fp, -4(sp)			#loading new frame pointer 
	
	
done:
	
