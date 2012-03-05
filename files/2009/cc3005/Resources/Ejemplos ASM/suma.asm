.MODEL SMALL
.STACK 64
.DATA



.CODE 
MAIN		PROC FAR
		MOV AX,@data		;inicializa segmento de datos
		.STARTUP		
NUM1 		DB	2		;almacenar en memoria el primer n�mero a sumar
NUM2		DB	7		;almacenar en memoria el segundo n�mero
NUM3		DB 	48		;n�mero a sumar para obtener el ascii del n�mero


		MOV CH, NUM1 
		MOV DH, NUM2
		MOV CL, NUM3

		ADD CH, DH		;sumar los dos primeros n�meros, almacenar en AX
		ADD CH, CL		;sumar la suma anterior con el tercer n�mero, en AX

		MOV AH, 02H		;Petici�n de la funci�n para desplegar
		MOV DL, CH		;valor del caracter que esta almacenado en AX

		INT 21H			;llamar a la interrupci�n para mostrar mensaje

		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		END MAIN
