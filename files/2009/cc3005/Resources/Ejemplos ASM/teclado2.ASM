; Manejo de teclado
; Teclado2.asm
; Verifica si se presiono tecla de funcion
; utilizando la funci�n 06H
.model small
.stack 64
.data
;--------------------------------------------------------------
ASC		DB		'Presiono tecla normal$'
CAD    	DB      'Presiono F1$'
;--------------------------------------------------------------
.code
;----------------- Procedimiento de teclado -------------------
TECLADO PROC
CICLO:  MOV	AH, 06H			; Petici�n directa a consola
		MOV	DL, 0FFH		; Entrada del teclado
		INT	21H
		JZ	CICLO			; Repetir si buffer esta vac�o
		CMP	AL, 0			; �Presiono tecla de funci�n?
		JNZ	ASCII			; No, es car�cter ASCII
		INT 21H				; Si, repite operaci�n
		CMP AL, 3BH			; presiono f1 ?
		JE F1       		; si
		JMP SALIR			; no, salir
ASCII: 	LEA DX,ASC
		MOV AH,09H
		INT 21H
		JMP SALIR
F1:		LEA DX,CAD  		; desplegar una cadena
		MOV AH,09H
		INT 21H
SALIR:	RET
TECLADO ENDP
;----------------- Programa principal -------------------------
MAIN PROC NEAR
		MOV AX,@DATA ; inicializar area de datos
		MOV DS,AX
		CALL TECLADO
		MOV AX,4C00H
		INT 21H
MAIN ENDP
;--------------------------------------------------------------
END MAIN
