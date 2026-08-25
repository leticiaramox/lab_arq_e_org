#guarda o endereco inicial da string
addi x11, x0, 28

Loop:
lb x10, 0(x11)
beq x10, x0, Fim
sb x10, 1024(x0)
addi x11, x11, 1
beq x0, x0, Loop

Fim:
halt

str1: .string "Hello World"
