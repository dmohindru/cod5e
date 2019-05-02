# A = C[0] << 4;
# $t1 = A, $t2 = B, $s1 = C
lw $t2, 0($s1)
sll $t1, $t2, 2