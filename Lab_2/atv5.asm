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
