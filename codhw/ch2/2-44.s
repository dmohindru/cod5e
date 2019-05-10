try:
        ll  $t0, 0($a1)     # load shvar into $t0
        slt $t1, $t0, $a2   # $t1 = 1 if (shvar < x), $t1 = 0 otherwise
        beqz $t1, skip
        add $t3, $a0, $zero
        sc $t3, 0($a1)
        beqz $t3, try
skip: