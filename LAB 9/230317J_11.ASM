; ===== LAB 11 (MULTIPLY 1 TO 5 & OUTPUT TO 7SEG DISPLAY)======================================
	CLO		;close unwanted windows

	MOV AL,5	;copy a 5 in to AL register
	MOV BL,1	;copy a 1 in to BL register
START:	
	MUL BL,AL	;multiply BL and AL and store in to BL
	DEC AL		; decrement AL by 1
	JNZ START	;jump to start if  not AL is zero 

; ===== Setup 7SEG display ===========================================

	MOV	AL,8A	; 
	OUT	02	; Send the data in AL to Port 02
	MOV	AL,FF	; 
	OUT	02	; Send the data in AL to Port 02

END


; ===== Program Ends ===========================================