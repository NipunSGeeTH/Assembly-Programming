; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================
Start:
	MOV	AL,A	; 0000 0001
	OUT	02	; Send the data in AL to Port 02
	MOV	AL,8B	; 1000 0001
	OUT	02	; Send the data in AL to Port 02



	JMP	Start
	
	END
; ======================================================