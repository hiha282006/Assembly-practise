;EasyCodeName=enigmatic,1
.Data
hInst	DQ		0
;slot1   	db	5
;slot2		db	2
;slot3		db	3
;settings	db	3 DUP 1

plug1		db	2Fh
plug2		db	16h
rotten      db  ?
welcome     db  'Enigma-like file encryptor',0Dh,0Ah

;===================================
; Rotors which provide key stream
;=================================== 
rotor  struct
   hex			dq
   notch		db
ends
rotor1		rotor	<01F46C8037B9AD25Eh,0Fh>
rotor2		rotor	<0EFA87B439D5216C0h,03h>
rotor3		rotor	<00F732D168C4BA59Eh,0Dh>
rotor4		rotor	<0F0E8143CA2695B9Dh,00h>
rotor5		rotor	<0AB8736E1F0C295D4h,03h>

;===============================================
; Encryptor slots into which rotors are placed
;===============================================
slot  struct
   rotty    rotor
   rotno    db
   rotstart db
ends
slot1	slot
slot2	slot
slot3	slot

.Code

start:
	Invoke GetModuleHandleA, 0
	Mov [hInst], Rax
	Invoke Main
	Invoke ExitProcess, 0

Main Frame
	;=====================
	; Write your code here
	;=====================
    mov rax,[rotor5.hex]
    mov [slot1.rotty.hex],rax
    mov al,[rotor5.notch]
    mov [slot1.rotty.notch],al    
    mov b[slot1.rotno],5
    mov b[slot1.rotstart],0Ah
    mov	rbx,[slot1.rotty.hex]

	ret
EndF
