# Solution for ex 2-3
# B[8] = A[i-j];
# i: $s3, j: $s4, A: $s6, B: $s7
# assuming all ints
sub     $t0, $s3, $s4       # $t0 = i - j
add     $t0, $s6, $t0       # $t0 = A + (i-j)
sll     $t0, $t0, 2         # compute $t0 = $t0 * 4
lw		$t1, ($t0)		    # $t0 = A[i-j]
sw		$t1, 32($s7)		# B[8] = A[i-j] 
 
    