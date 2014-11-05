	.section	__TEXT,__text,regular,pure_instructions
	.globl	_mythread
	.align	4, 0x90
_mythread:                              ## @mythread
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$10, %eax
	movl	$15, %ecx
	movl	$2, %edx
	movl	%edi, -4(%rbp)
	movl	$0, -16(%rbp)
	movl	$5, -20(%rbp)
	movl	-4(%rbp), %edi
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	movl	%edi, %eax
	movl	%edx, -28(%rbp)         ## 4-byte Spill
	cltd
	movl	-28(%rbp), %edi         ## 4-byte Reload
	idivl	%edi
	cmpl	$0, %edx
	sete	%sil
	testb	$1, %sil
	movl	-24(%rbp), %eax         ## 4-byte Reload
	cmovel	%ecx, %eax
	movl	%eax, -16(%rbp)
	movl	$0, -8(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	LBB0_8
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str(%rip), %rdi
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edx
	movb	$0, %al
	callq	_printf
	movl	$0, -12(%rbp)
	movl	%eax, -32(%rbp)         ## 4-byte Spill
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB0_6
## BB#4:                                ##   in Loop: Header=BB0_3 Depth=2
	jmp	LBB0_5
LBB0_5:                                 ##   in Loop: Header=BB0_3 Depth=2
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_7
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB0_1
LBB0_8:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"This is message %d of thread #%d.\n"


.subsections_via_symbols
