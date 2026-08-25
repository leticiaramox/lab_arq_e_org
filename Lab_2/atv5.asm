lw x10, v1        # x10 = a 
lw x11, v2        # x11 = b

sw x10, v3        

bge x11, x10, fim_if

add x12, x10, x11 # x12 = a + b
sw x12, v3     

fim_if:
halt

v1: .word 14      # int a = 6
v2: .word 7       # int b
v3: .word 0       # int m = 0
