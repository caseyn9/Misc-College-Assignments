option casemap:none             ; case sensitive
 
extern  printf:near             ; printf


.data
public g
g QWORD 256

.code

            

;rcx,rdx,r8,r9
 
 public p 

 p:	
	mov rax, rcx
	mov rcx, rdx
	add rax, rcx
	shl rax, 2
	dec rax

	ret 0

public q

q:	

	mov rax, rcx
	neg rax
	mov rcx,rax
	mov rdx, g
	call p
	ret 0

public f
f:					;push ebp
					;mov ebp,esp

					;mov ecx, [ebp + 8]	; get n
	cmp rcx, 0			;if(n>0){
	jle else1			;	
	mov rdx, rcx		;	copyN = n
	dec rdx				;	copyN--
	push rcx			;
	mov rcx, rdx	
	sub rsp, 32
	call f				;	result = f(copyN)
					;sub esp, 4
	add rsp, 32
	pop rcx			;mov ecx, [ebp + 8]	; get n
	mul rcx				;	n*result
	jmp endIf1			;

else1:		
	mov rax, 1			;
endIf1:
					;mov esp, ebp		;
					;pop ebp				;
	ret 0				;

fxp5       db      '"a = %I64d b = %I64d c = %I64d d = %I64d e = %I64d sum = %I64d"', 0AH, 00H     ; string in code section,  OAH = LF
fxp5b      db      '"a = %I64d b = %I64d a*b = %I64d"', 0AH, 00H     ; string in code section,  OAH = LF

public      xp5                                ; make sure function name is exported

xp5:		sub rsp, 56							;shadow space + params
			lea rax, [rcx + rdx]
			add rax, r8
			add rax,r9							
			mov r10, [rsp + 96]					;get e
			add rax, r10

			mov [rsp + 48], rax					
			mov [rsp + 40], r10
			mov [rsp+32], r9
			mov r9,r8				; r9 = c
			mov r8,rdx				;r8 = b
			mov [rsp+64], r8
			mov rdx,rcx				;rdx = a
			mov [rsp+72], rdx
			mov[rsp + 80], rax
			lea rcx, fxp5
			call printf
			
									;rcx = string, rdx = a, r8 = b, r9 = result
			mov r8, [rsp+64]
			mov rdx, [rsp+72]
			mov rax, r8				;result = A*B
			mul rdx					;rax = result
			mov r9, rax
			mov rdx, [rsp+72]
			lea rcx, fxp5b
			
			call printf

			mov rax,[rsp + 80]		;return sum

			add rsp, 56

			ret 0
    
            end

; eof