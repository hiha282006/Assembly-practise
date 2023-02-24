.Data
hInst	 DQ	0
string1	 db 'Frank Sinatra',0
string2  db 'Frank Zappa',0
.Code

start:
	Invoke GetModuleHandleA, 0
	Mov [hInst], Rax
	Invoke Main
	Invoke ExitProcess, 0

Main Frame
	;=====================
	; Demo 1
  	;=====================
    mov   eax,2
roo:
    dec   eax			; if eax is zero, set the zero flag
    jnz   roo			; jump if zero flag set
    ;=====================
	; Demo 2
	;=====================
    mov   rbx,0403Ah
    cmp   bl,03Ah		; compare bl with 3A
    je    >kanga		; jump to named label if bl=3A
    nop
    jmp koala 			; unconditional jump
kanga:
    nop
koala:
    ;=====================
	; Demo 3
	;======================
    mov	  al,10
    cmp	  al,5
    jge   >				; if al>=5, go to the next unnamed label
    nop					; do some processing if less
    ;======================
	; Demo 4
	;======================
:   mov   ecx,4
redback:
    nop					; do some processing...
    loop redback		; decrement ecx and loop if not zero
    ;------------------------
	; string compares
    cld
    mov  esi, addr string1
    mov	 edi, addr string2
    mov  ecx,14
	rep    cmpsb
	jne >
	nop					; do some processing if we're equal
:   ret
EndF

