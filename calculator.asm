org 100h
  
PUTC    MACRO   char
        PUSH    AX
        MOV     AL, char
        MOV     AH, 0Eh
        INT     10h     
        POP     AX
ENDM



jmp start


   
   a dw 0
   b dw 0
   c dw 0 
   msg:   db       "Veuillez choisir un operateur:$"
   msg0:   db       "Votre resultat est:$"
   msg1:   db      0dh,0ah,"1-'+'",0dh,0ah,"2-'-'",0dh,0ah,"3-'*'",0dh,0ah,"4-'/'",0dh,0ah,"5-'!'",0dh,0ah,"6-'^'", 0dh,0ah,"7-'a'", 0dh,0ah,"8-'c'",0dh,0ah,"9-'G'",0dh,0ah,"A-'quitter le programme'",0dh,0ah,'$'
   msg2:   db      0dh,0ah,"Entrer le premier nombre: $"
   msg3:   db      0dh,0ah,"Entrer le deuxieme nombre: $"
   msg4:   db      0dh,0ah,"erreur de choix ! $" 
   msg5:   db      0dh,0ah,"Result : $" 
   msg6:   db      0dh,0ah ,'merci beaucoup ', 0dh,0ah, '$' 
   msg7:   db      0dh,0ah ,"Veuillez saisir l'exposant:$"
   msg8:   db      0dh,0ah ,"erreur de division par 0 !:$"


 

    
start:    mov ah,9
          mov dx, offset msg1 
          int 21h
    
          mov ah,9
          mov dx, offset msg 
          int 21h
    
          mov ah,01h
          int 21h   
    
          cmp al,31h 
          je addition
    
          cmp al,32h 
          je soustraction
          
          cmp al,33h 
          je multiplication
          
          cmp al,34h 
          je division
          
          cmp al,35h 
          je factorielle
          
          cmp al,36h 
          je puissance
          
          cmp al,37h 
          je arrangement
          
          cmp al,38h 
          je combinaison
          
          cmp al,39h 
          je pgcd
          
          cmp al,41h 
          je exit
          
          jmp choix  
    
    
choix:      mov ah,9  
            mov dx, offset msg4 
            int 21h
            
            call exit   
    
            
addition:   mov ah,9  
            mov dx, offset msg2 
            int 21h
     
            call SCAN_NUM
            mov a, cx
     
            mov ah,9  
            mov dx, offset msg3 
            int 21h
     
            call SCAN_NUM
            mov b, cx
            
            mov ah, 02h
            mov dl, 10
            int 21h
            
            mov ah,9  
            mov dx, offset msg0 
            int 21h
     
            mov ax, a
            add ax, b 
     
            mov cx, 0
            mov dx, 0
            mov bx, 10
            call affichage            
            
            
   
soustraction:   mov ah,9  
                mov dx, offset msg2 
                int 21h
     
                call SCAN_NUM
                mov a, cx
     
                mov ah,9  
                mov dx, offset msg3 
                int 21h
     
                call SCAN_NUM
                mov b, cx
            
                mov ah, 02h
                mov dl, 10
                int 21h
            
                mov ah,9  
                mov dx, offset msg0 
                int 21h
     
                mov ax, a
                sub ax, b 
     
                mov cx, 0
                mov dx, 0
                mov bx, 10
                call affichage
                
                
                
                
                
multiplication:   mov ah,9  
                  mov dx, offset msg2 
                  int 21h
     
                  call SCAN_NUM
                  mov a, cx
     
                  mov ah,9  
                  mov dx, offset msg3 
                  int 21h
     
                  call SCAN_NUM
                  mov b, cx
            
                  mov ah, 02h
                  mov dl, 10
                  int 21h
            
                  mov ah,9  
                  mov dx, offset msg0 
                  int 21h
     
                  mov ax, a
                  mul b 
     
                  mov cx, 0
                  mov dx, 0
                  mov bx, 10
                  call affichage
    
 
 
division:       mov ah,9  
                mov dx, offset msg2 
                int 21h
     
                call SCAN_NUM
                mov a, cx
     
                mov ah,9  
                mov dx, offset msg3 
                int 21h
     
                call SCAN_NUM
                mov b, cx
                cmp b, 0
                je erreur
            
                mov ah, 02h
                mov dl, 10
                int 21h
            
                mov ah,9  
                mov dx, offset msg0 
                int 21h
                
                mov dx, 0
                mov ax, a
                div b 
     
                mov cx, 0
                mov dx, 0
                mov bx, 10
                call affichage 
                
                erreur:
                  
                    mov ah,9  
                    mov dx, offset msg8 
                    int 21h
                    
                    call exit
                
                
                
                
                
                
puissance:      mov ah,9  
                mov dx, offset msg2 
                int 21h
     
                call SCAN_NUM
                mov a, cx
                
                mov ah,9  
                mov dx, offset msg7 
                int 21h
     
                call SCAN_NUM
                mov b, cx
                
                mov ah, 02h
                mov dl, 10
                int 21h
            
                mov ah,9  
                mov dx, offset msg0 
                int 21h
                
                mov ax,a
                mov bx,b
                dec bx
                
                boucle2: 
             
                   mul a
                   dec bx
                   cmp bx,0
                   jne boucle2
               
                   mov cx, 0
                   mov dx, 0
                   mov bx, 10
                   call affichage
                   
                   
arrangement:    mov ah,9  
                mov dx, offset msg2 
                int 21h
     
                call SCAN_NUM
                mov a, cx
     
                mov ah,9  
                mov dx, offset msg3 
                int 21h
     
                call SCAN_NUM
                mov b, cx
                
                mov ah, 02h
                mov dl, 10
                int 21h
            
                mov ah,9  
                mov dx, offset msg0 
                int 21h
                
                mov ax, a
                sub ax, b
                mov b, ax
                mov bx, 1
                 
                 
                boucle3: 
             
                  mul bx
                  inc bx
                  cmp bx,b
                  jl boucle3
                
                
                
                
                mov cx, ax
                mov ax, a
                mov bx, 1
                
                boucle4: 
             
                  mul bx
                  inc bx
                  cmp bx,a
                  jl boucle4
                
                mov dx, 0
                div cx 
                
                
                mov cx, 0
                mov dx, 0
                mov bx, 10
                call affichage
                
                
                
combinaison:    mov ah,9  
                mov dx, offset msg2 
                int 21h
     
                call SCAN_NUM
                mov a, cx
     
                mov ah,9  
                mov dx, offset msg3 
                int 21h
     
                call SCAN_NUM
                mov b, cx
                
                mov ah, 02h
                mov dl, 10
                int 21h
            
                mov ah,9  
                mov dx, offset msg0 
                int 21h
                
                mov ax, a
                sub ax, b
                mov c, ax
                mov bx, 1
                 
                 
                boucle5: 
             
                  mul bx
                  inc bx
                  cmp bx,c
                  jl boucle5
                
                
                
                
                mov cx, ax
                mov ax, b
                mov bx, 1
                
                boucle6: 
             
                  mul bx
                  inc bx
                  cmp bx,b
                  jl boucle6 
                  
                mul cx  
                
                
                mov cx, ax
                mov ax, a
                mov bx, 1
                
                boucle7: 
             
                  mul bx
                  inc bx
                  cmp bx,a
                  jl boucle7
                
                mov dx, 0
                div cx
                
                mov cx, 0
                mov dx, 0
                mov bx, 10
                call affichage 
                
                
pgcd:           mov ah,9  
                mov dx, offset msg2 
                int 21h
     
                call SCAN_NUM
                mov a, cx
     
                mov ah,9  
                mov dx, offset msg3 
                int 21h
     
                call SCAN_NUM
                mov b, cx
                
                mov ah, 02h
                mov dl, 10
                int 21h
            
                mov ah,9  
                mov dx, offset msg0 
                int 21h
                
                mov ax, a
                mov bx, b
                
                boucle8:
                    
                    cmp ax, bx
                    jg soustraction1
                    jmp soustraction2
                    
                continuer: 
                
                    cmp ax, bx
                    je fin
                    jmp boucle8
                    
                soustraction1: 
                
                    sub ax, bx
                    jmp continuer
                    
                soustraction2: 
                
                    sub bx, ax
                    jmp continuer
                    
                fin: 
                   
                   mov cx, 0
                   mov dx, 0
                   mov bx, 10
                   call affichage  
                    
                    
               
                

factorielle:    mov ah,9  
                mov dx, offset msg2 
                int 21h 
                
                call SCAN_NUM
                mov a, cx 
                
                
                mov ah, 02h
                mov dl, 10
                int 21h
            
                mov ah,9  
                mov dx, offset msg0 
                int 21h
                
                mov ax, a
                mov bx, 1
                
             boucle1: 
             
               mul bx
               inc bx
               cmp bx,a
               jl boucle1
               
               mov cx, 0
               mov dx, 0
               mov bx, 10
               
               
               
              
                  
 
  
affichage: 
             empiler: 
     
                div bx
                add dx, 48
                push dx   
                mov dx, 0
                inc cx
                cmp ax, 0
                jne empiler
        
        
        
             depiler: 
     
               pop dx
               mov ah, 02h
               int 21h
               loop depiler
               
               
               
               mov ax, 0
               mov bx, 0
               mov cx, 0
               mov dx, 0
               
               jmp start
     
    
     
exit: 

        mov dx,offset msg6
        mov ah, 9
        int 21h  


        mov ax, 4c00h
        int 21h

             
     
     
     
     
     
     
    

    


 
 
 
SCAN_NUM        PROC    NEAR
        PUSH    DX
        PUSH    AX
        PUSH    SI
        
        MOV     CX, 0

        ; reset flag:
        MOV     CS:make_minus, 0

next_digit:

        ; get char from keyboard
        ; into AL:
        MOV     AH, 00h
        INT     16h
        ; and print it:
        MOV     AH, 0Eh
        INT     10h

        ; check for MINUS:
        CMP     AL, '-'
        JE      set_minus

        ; check for ENTER key:
        CMP     AL, 13  ; carriage return?
        JNE     not_cr
        JMP     stop_input
not_cr:


        CMP     AL, 8                   ; 'BACKSPACE' pressed?
        JNE     backspace_checked
        MOV     DX, 0                   ; remove last digit by
        MOV     AX, CX                  ; division:
        DIV     CS:ten                  ; AX = DX:AX / 10 (DX-rem).
        MOV     CX, AX
        PUTC    ' '                     ; clear position.
        PUTC    8                       ; backspace again.
        JMP     next_digit
backspace_checked:


        ; allow only digits:
        CMP     AL, '0'
        JAE     ok_AE_0
        JMP     remove_not_digit
ok_AE_0:        
        CMP     AL, '9'
        JBE     ok_digit
remove_not_digit:       
        PUTC    8       ; backspace.
        PUTC    ' '     ; clear last entered not digit.
        PUTC    8       ; backspace again.        
        JMP     next_digit ; wait for next input.       
ok_digit:


        ; multiply CX by 10 (first time the result is zero)
        PUSH    AX
        MOV     AX, CX
        MUL     CS:ten                  ; DX:AX = AX*10
        MOV     CX, AX
        POP     AX

        ; check if the number is too big
        ; (result should be 16 bits)
        CMP     DX, 0
        JNE     too_big

        ; convert from ASCII code:
        SUB     AL, 30h

        ; add AL to CX:
        MOV     AH, 0
        MOV     DX, CX      ; backup, in case the result will be too big.
        ADD     CX, AX
        JC      too_big2    ; jump if the number is too big.

        JMP     next_digit

set_minus:
        MOV     CS:make_minus, 1
        JMP     next_digit

too_big2:
        MOV     CX, DX      ; restore the backuped value before add.
        MOV     DX, 0       ; DX was zero before backup!
too_big:
        MOV     AX, CX
        DIV     CS:ten  ; reverse last DX:AX = AX*10, make AX = DX:AX / 10
        MOV     CX, AX
        PUTC    8       ; backspace.
        PUTC    ' '     ; clear last entered digit.
        PUTC    8       ; backspace again.        
        JMP     next_digit ; wait for Enter/Backspace.
        
        
stop_input:
        ; check flag:
        CMP     CS:make_minus, 0
        JE      not_minus
        NEG     CX
not_minus:

        POP     SI
        POP     AX
        POP     DX
        RET
make_minus      DB      ?       ; used as a flag.
ten             DW      10      ; used as multiplier.
SCAN_NUM        ENDP