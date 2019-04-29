# Solution for ex 2-5
# B[g] = A[f] + A[f+1]
# A: $s6, B: $s7, f: $s0
main:
sll     $t0, $s0, 2     # $t0 = f * 4
add		$t0, $s6, $t0	# $t0 = &A[f]
sll     $t1, $s1, 2     # $t1 = g * 4
add     $t1, $s7, $t1   # $t1 = &B[g]
lw		$t2, 0($t0)		# $t2 = A[f]
lw      $t3, 4($t0)     # $t3 = A[f+1]
add     $t3, $t3, $t2   # $t3 = A[f] + A[f+1]
sw		$t3, 0($s1)		# B[g] =  A[f] + A[f+1]
 


