	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	leaq	L_.str(%rip), %rbx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$10, %edx
	movl	$10, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$2, %esi
	movl	$10, %edx
	movl	$20, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$3, %esi
	movl	$10, %edx
	movl	$30, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$4, %esi
	movl	$10, %edx
	movl	$40, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$5, %esi
	movl	$10, %edx
	movl	$50, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$6, %esi
	movl	$10, %edx
	movl	$60, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$7, %esi
	movl	$10, %edx
	movl	$70, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$8, %esi
	movl	$10, %edx
	movl	$80, %ecx
	xorl	%eax, %eax
	callq	_printf
	movq	%rbx, %rdi
	movl	$9, %esi
	movl	$10, %edx
	movl	$90, %ecx
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d x %d = %d\n"


.subsections_via_symbols
