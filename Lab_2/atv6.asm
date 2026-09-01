addi x10, x0, 1 
sb x10, 1029(x0) #Acende led 1

loop:
    lb x11, 1026(x0) #Leitura de botão
    andi x11, x11, 0x1 
    beq x11, x0, loop #Fica no loop até o botão ser apertado

botao:
    lb x11, 1026(x0) #ler botao novamente
    andi x11, x11, 0x1
    bne x11, x0, botao #se nao voltou a 0, espera soltar 

    slli x10, x10, 1
    addi x12, x0, 64 
    bne x10, x12, acende_led 
    jal x0, fim 

acende_led:
    sb x10, 1029(x0) 
    jal x0, loop

fim: halt
