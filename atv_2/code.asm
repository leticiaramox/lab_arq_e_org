lw x10, v1
lw x11, v2
lw x12, v3

bge x11, x12, senao

add x12, x10, x11
jal x0, fim_if

senao:
sub x12, x10, x11

fim_if: 
sw x12, v3
halt

v1: .word 6
v2: .word 15
v3: .word 0

