# for(i=0; i<a; i++)
#   for(j=0; j<b; j++)
#       D[4*j] = i + j;
# a: $s0, b: $s1, i: $t0, j: $t1, D: $s2

    xor     $t0, $t0, $t0   # initalize i = 0
OUTER_FOR:
    slt     $t2, $t0, $s0   # t2 = 1, if (i < a), 0 otherwise
    beq     $t2, $0, OUTER_FOR_DONE
    xor     $t1, $t1, $t1   # initalize j = 0
INNER_FOR:
    slt     $t2, $t1, $s1   # t2 = 1, if (j < b), 0 otherwise
    beq     $t2, $0, INNER_FOR_DONE
    sll     $t2, $t1, 4     # computer j * 4 * 4
    add		$t2, $s2, $t2   # &D[4*j]
    add     $t3, $t0, $t1   # t3 = i + j
    sw		$t3, 0($t2)		# D[4*j] = i + j
    addi    $t1, $t1, 1     # j++
    j		INNER_FOR		# jump to start of inner for
INNER_FOR_DONE:
    addi    $t0, $t0, 1     # i++
    j       OUTER_FOR       # jump to start of outer for
OUTER_FOR_DONE: