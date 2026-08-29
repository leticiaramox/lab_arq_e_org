main:
    addi x11, x0, 28

loop_print:
    lb x10, 0(x11)          # le o caractere
    beq x10, x0, inicio_echo # se for 0, encerra o print do texto
    sb x10, 1024(x0)        # escreve na tela
    addi x11, x11, 1        # avanca proximo caractere
    beq x0, x0, loop_print

inicio_echo:
    addi x12, x0, 42        # ASCII do '*'

loop_echo:
    lb x10, 1025(x0)        # le o teclado
    beq x10, x0, loop_echo  # nao digitou nada (0), aguarda ate digitar
    beq x10, x12, fim       # digitou '*', encerra
    sb x10, 1024(x0)        # Imprime o caractere digitado
    sb x0, 1025(x0)
    beq x0, x0, loop_echo

fim:
    halt

str1: .string "Hello World"
