
lw x19, v1      # f
lw x20, v2      # g
lw x21, v3      # h
lw x22, v4      # i
lw x23, v5      # j

beq x22, x23, igual
sub x19, x20, x21
jal x0, fim_condicao

igual:
add x19, x20, x21

fim_condicao:
sw x19, v1

halt



v1: .word 0
v2: .word 20
v3: .word 10
v4: .word 34
v5: .word 17
