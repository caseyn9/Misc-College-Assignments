add r0, #256, r9	; global int g = 256

 p:	
	add, r26, r27, r16
	sll r16, #2, r1
	ret r25 , 0
	sub r1, #1, r1

q:	

	add r9, r0, r10
	callr r25, p
	sub r0, r26, r11
	ret r25, 0
	add r0, r0, r0

	
f:	
	add r0, r26, r16
	sub r16, r0, r0{C}
	jle EIf1			;if(n>0){
	add r0, r0, r0
	
	sub r16, #1, r17	;	tmp = n-1
	callr r25, f		;	tmp2 = f(tmp)
	add r0, r17, r10	; tmp as 1st param
	add r0, r16, r10	; n as 1st param
	callr r25, multiply	;	assuming existince of multiply	function.
	add r0, r1, r11		; tmp2 as 2nd param.
	ret r25, 0			;	return n*(f(tmp))
	add r0, r0, r0
	
EIf1:
	ret r25, 0
	add r0, #1, r1