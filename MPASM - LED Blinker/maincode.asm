;Programa para prender/apagar un LED en RB0
;Por Kalun 30/04/2022
;Después de 20 años que vuelvo a usar un PIC16F84A    
    
    list p=16f84a
    #include <p16f84a.inc>
    
    __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _CP_OFF
    
    org 0x0000
    goto configuro
    
    cblock 0x0C
	var_i
	var_j
	var_k
    endc
    
    org 0x0007
configuro:  bsf STATUS, 5	;Para el BANK1
	    bcf TRISB, 0	;RB0 como salida
	    bcf STATUS, 5	;Para el BANK0
inicio:	    bsf PORTB, 0	;RB0 a uno
	    call delay_long	;Retardo
	    bcf PORTB, 0	;RB0 a cero
	    call delay_long	;Retardo
	    goto inicio		;Salto a inicio
	    
;subrutina de retardo    
delay_long:    
    movlw .50
    movwf var_i
otro1:
    call bucle1		;Salto a subrutina
    decfsz var_i,f
    goto otro1
    return
bucle1:
    movlw .55
    movwf var_j
otro2:
    nop
    nop
    call bucle2		;Salto a subrutina
    decfsz var_j,f
    goto otro2
    return
bucle2:
    movlw .20
    movwf var_k
otro3:
    nop
    decfsz var_k,f
    goto otro3
    return 
    
    end
