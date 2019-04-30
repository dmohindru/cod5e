# B[8] = A[i] + A[j];
# A: s6, B: s7, i: s3, j: s4
sll $t0, $s3, 2 # t0 = i * 4
sll $t1, $s4, 2 # t1 = j * 4
add $t0, $s6, $t0 # t0 = &A[i] 
add $t1, $s6, $t1 # t1 = &A[j]
lw $t0, ($t0)   # t0 = A[i]
lw $t1, ($t1)   # t1 = A[j]
add $t0, $t0, $t1 # t0 = A[i] + A[j]
sw $t0, 32($s7) # B[8] = A[i] + B[j]


