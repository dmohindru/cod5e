        addi    $t1, $s0, 400
LOOP:   lw      $s1, 0($s0)
        add     $s2, $s2, $s1
        addi    $t1, $t1, -4
        bne     $t1, $s0, LOOP