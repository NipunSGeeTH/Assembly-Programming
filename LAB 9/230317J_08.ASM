; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows and reset environment.

Start:				; Main program loop begins.

	MOV AL,84	; Set AL to 84 (traffic lights pattern OFF).
	OUT 01		; Send the value in AL to Port 01 (traffic lights control).
	CALL 30		; Call the short time delay procedure at address [30].

	MOV AL,48	; Set AL to 48 (traffic lights pattern ON).
	OUT 01		; Send the value in AL to Port 01 (traffic lights control).

	MOV AL,30	; Set AL to 30 (another traffic lights pattern).
	OUT 01		; Send the new value in AL to Port 01 (traffic lights control).

	CALL 50		; Call the longer time delay procedure at address [50].

	JMP Start	; Repeat the loop forever (simulate traffic light cycles).

; ---------------------------------------------------------------


; ----- Time Delay Procedure Stored At Address [30] -------------
	ORG 30		; Start generating machine code from memory address [30].

	PUSH AL		; Save the current AL value on the stack (protect AL).
	PUSHF		; Save the CPU flags on the stack (protect flags).

	MOV AL,A	;  Set AL to 10 for a medium delay.
Rep2:			; Start of a delay loop.
	DEC AL		; Decrease AL by 1.
	JNZ Rep2	; If AL is not zero, jump back to Rep2 and repeat.

	POPF		; Restore CPU flags from the stack.
	POP AL		; Restore original AL value from the stack.

	RET		; Return to the calling program (back to after CALL 30).
; ---------------------------------------------------------------


; ----- Time Delay Procedure Stored At Address [50] -------------
	ORG 50		; Start generating machine code from memory address [50].

	PUSH AL		; Save the current AL value on the stack (protect AL).
	PUSHF		; Save the CPU flags on the stack (protect flags).

	MOV AL,5	; Set AL to 5 for a shorter delay.

Rep1:			; Start of another delay loop.
	DEC AL		; Decrease AL by 1.
	JNZ Rep1	; If AL is not zero, jump back to Rep1 and repeat.

	POPF		; Restore CPU flags from the stack.
	POP AL		; Restore original AL value from the stack.

	RET		; Return to the calling program (back to after CALL 50).
; ---------------------------------------------------------------


; ===== Program Ends ==========================================
	END		; Mark the end of the program.
; ---------------------------------------------------------------
