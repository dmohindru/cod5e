# assembly file to test slt instruction
main:
    addi $t0, $t0, 4
    addi $t1, $t1, 0
    slt $t2, $0, $t0
    slt $t2, $0, $t1
