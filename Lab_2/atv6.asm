main:
    addi x12, x0, 2          # x12 = current LED GPIO number, start at GPIO 2
    addi x13, x0, 0          # x13 = previous button state (0 = released)

    lb   x11, 36(x0)         # HIGH
    sb   x11, 1027(x12)      # turn ON LED at GPIO 2 (output addr 1027+2 = 1029)

loop:
    lb   x10, 1026(x0)       # read button -- GPIO 2 input, as in your original code
    andi x10, x10, 0x1

    beq  x10, x0, update     # button not pressed -> nothing to do
    bne  x13, x0, update     # button still held from before -> ignore (edge detect)

    # --- rising edge: advance to next LED ---
    lb   x11, 37(x0)         # LOW
    sb   x11, 1027(x12)      # turn off current LED

    addi x12, x12, 1         # next GPIO number

    lb   x11, 36(x0)         # HIGH
    sb   x11, 1027(x12)      # turn on new current LED

    addi x14, x0, 7
    beq  x12, x14, stop      # just lit LED 7 -> stop

update:
    add  x13, x10, x0        # prev_button = current button
    jal  x0, loop

stop:
    jal  x0, stop             # halt here

HIGH: .byte 1
LOW:  .byte 0
