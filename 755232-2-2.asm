

.data62
@62 vector: .asciil6 "DIEGO MARCO." ; 0x0044,0x0049,0x0045,0x0047,0x004F,0x0020,0x004d,0x0041,0x0052.0x0043,0x004f,0x002e
@62 letra: .rw 1
@73 punto: .asciil6 "."               #Caracter 46 tabla asciil6
@75 nulo: .dw 0                       #constante 0
@76 constante: .dw 128                #constante 128
@67 space: .asciil6 " "               #caracter 32 tabla asciil6
.data127                              #memoria para imprimir rn tty-out
@127 tty-out: .rw 1



.code
@0          MOV nulo, tty-out         #Limpia la pantalla tty-out
@1          MOV vector, letra         #Inicializa la variable letra
@2  WHILE:  CMP letra, punto          #compara letra con punto
@3          BEQ 1HALT                 #salta a 1HALT
@4          CMP letra, space          #Compara letra con espacio
@5          BEQ 2HALT                 #Salta a 2HALT
@6          MOV letra, tty-out        #Imprime letra por pantalla
@7          ADD constante, INST       #Añade "constante" a la instrucción @8 para que letra=vector+1
@8  INST:   MOV vector, letra        #Actualiza "letra"
@9          CMP nulo, nulo            #Comparación para forzar salto
@10         BEQ WHILE                 #Salto a WHILE
@11 2HALT:  MOV letra,tty-out         #Imprime caracter " " por pantalla
@12         ADD constante, INST       #Añade constante a @8 para pasar a la posición i+1 del vector
@13         CMP nulo, nulo            #Comparación para forzar
@14         BEQ INST                  #Salta a INST
@15 1HALT:  ADD letra,tty-out         #Imprime caracter "." por pantall
@16 END:    CMP nulo,nulo             #comparacion para forzar salto
@17        BEQ END                   #Salta a END
.end 




