
;**************************************************************
; Programa "for1" carga en AL las veces que es mostrado en 
; pantalla un dato. Luego repite el despliegue AL veces.
;**************************************************************




.MODEL SMALL       
.STACK 100H

.DATA
 
	MEN1    DB      'Digite el caracter a desplegar: ','$'
    MEN2    DB      'Digite un numero: ','$'	                                                                                                       
	
	ENTER   DB 0AH,0DH,'$';CREA UNA NUEVA LINEA 
	
	CAD     DB 4 dup (' '),'$'
	
	DATOS	DB	'?'
	        DB	'?'
	        DB	'?'	
            DB  '?'
	
	letra db '?'
   
    Filas DB 0
    AUX   DB 0
     
    x db 6
    y db 6 
     
     
.CODE
 
	MOV     AX,@DATA
    MOV     DS,AX

	
	lea     dx,men1
	call    mensaje
	
	
	MOV     AH,01H
	INT     21H		        ; carga el caracter a ser mostrado
	mov     letra,al
    
    call    clrscr	
	
	lea     dx, men2
	call    mensaje  
	
    MOV     AH,01H
	INT     21H		        ; CARGA EN "AL" LAS VECES A MOSTRAR
	
	SUB 	AL,30H          ; convertir valor de ascii a binario natural
  	MOV     [DATOS], AL   
    
	CALL    clrscr
	
	lea     dx, men2
	call    mensaje  
	
	MOV     AH,01H
	INT     21H		        ; CARGA EN "AL" LAS VECES A MOSTRAR
	
	SUB 	AL,30H          ; convertir valor de ascii a binario natural
  	MOV     [DATOS+1], AL      
    
    
	CALL    clrscr

	lea     dx, men2
	call    mensaje  
	
	MOV     AH,01H
	INT     21H		        ; CARGA EN "AL" LAS VECES A MOSTRAR
	
	SUB 	AL,30H          ; convertir valor de ascii a binario natural
  	MOV     [DATOS+2], AL      
    
    
	CALL    clrscr

	lea     dx, men2
	call    mensaje  
	
	MOV     AH,01H
	INT     21H		        ; CARGA EN "AL" LAS VECES A MOSTRAR
	
	SUB 	AL,30H          ; convertir valor de ascii a binario natural
  	MOV     [DATOS+3], AL      
    
    
	CALL    clrscr
        
	mov     bl,[DATOS] 
    mov     x,10
    mov     y,16
    call    matriz
    
    mov     bl,[DATOS+1] 
    mov     x,12
    mov     y,16
    call    matriz
    
    mov     bl,[DATOS+2] 
    mov     x,14
    mov     y,16
    call    matriz 
                   
    mov     bl,[DATOS+3] 
    mov     x,16
    mov     y,16
    call    matriz
                   
    mov     ah,01
    int     21h 
     
	MOV     AH,4CH      ; VUELTA AL
    INT     21H         ; DOS


;***********************DESPLIEGA EN PANTALLA*******************************

MENSAJE PROC
      	MOV	    AH,9
        INT     21H                     
        RET
ENDP
       
       
       
MENSAJE1 PROC
      	 MOV	 AH,2 ; solo imprime el caracter en DL
         INT     21H                     
         RET
ENDP
       

clrscr  proc
        MOV     AH,0
        MOV     AL,3
        INT     10H	
        ret
        endp

CURSOR  PROC
        MOV     AH,2
        MOV     DL,X
        MOV     DH,Y
        INT     10H                     ;Coloca cursor para dezplegar mensaje
        RET
ENDP
 
  
  
MATRIZ PROC
    
    MOV     AH,2
    MOV     DL,X
    MOV     DH,17
    INT     10H 
    
    MOV     AUX,BL
    ADD     AUX,30H
    
    MOV     DL,AUX      
   	CALL    MENSAJE1
    
    
OTRO:
    
    CALL    CURSOR 
            
    MOV     DL,LETRA      
   	CALL    MENSAJE1
   	   	
    DEC     Y
    DEC     BL
    JNZ     OTRO
    

         
    RET
ENDP
 
END
