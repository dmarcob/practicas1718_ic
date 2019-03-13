
.data62                    #Direción de datos de inicio.
@62 vector .asciil6 "DIEGO MARCO." ; 0x0044,0x0049,0x0045,0x0047,0x004F,0x0020,0x004d,0x0041,0x0052.0x0043,0x004f,0x002e  #Vector de caracteres asciil6 en código hexadecimal
@62 letra: .rw              
@73 punto: .asciil6 "."     #Caracter 46 de la tabla asciil6
@75 nulo: .dw 0             #constante 0
@76 constante: .dw 128      #constante 128
@77 2constante: .dw 32      #constante 32
@78 eme: .dw 77             #constante 77
@67 space: .dw 32           #caracter 32 tabla asciil6
.data127                    #memoria para imprimir rn tty-out
@127 tty-out: .rw




.code
@0          MOV nulo, tty-out         #Limpia la pantalla tty-out
@1          MOV vector, letra         #Inicializa la variable letra
@2          MOV letra,tty-out         #Imprime caracter "D" por pantalla
@3          ADD constante, INST       #Añade "constante" a la instrucción @12 para que letra=vector+1
@4          B INST		      #Salto incondicional a INST
@5  WHILE:  CMP letra, punto          #compara letra con punto
@6          BEQ 1HALT                 #salta a 1HALT
@7          CMP letra, space          #Compara letra con espacio
@8          BEQ 2HALT                 #Salta a 2HALT
@9	    CMP letra,eme             #Compara letra con "M"
@10         BEQ 3HALT                 #Salta a 3HALT
@11         ADD 2constante, letra     #Añade a letra, 2constante, para pasa de mayúsculas a minúsculas en código ascii6
@12         MOV letra, tty-out        #Imprime letra por pantalla
@13         ADD constante, INST       #Añade "constante" a la instrucción @12 para que letra=vector+1
@14  INST:  MOV vector, letra         #Actualiza "letra"
@15         B  WHILE                  #Salto incondicional a WHILE
@16 2HALT:  MOV letra,tty-out         #Imprime caracter " " por pantalla
@17         ADD constante, INST       #Añade "constante" a la instrucción @12 para que letra=vector+1          
@18         B  INST                   #Salto incondicional a INST
@19 1HALT:  ADD letra,tty-out         #Imprime caracter "." por pantalla
@20         HALT                      #Deja de ejecutar instrucciones para minimizar consumo
@21 3HALT:  MOV letra,tty-out         #Imprime caracter "M" por pantalla
@22         ADD constante, INST       #Añade "constante" a la instrucción @12 para que letra=vector+1          
@23         B  INST                   #Salto incondicional a INST
.end 




