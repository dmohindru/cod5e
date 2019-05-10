trylk:
        li		$t1, 1 		        # set t1 to lock unset condition
        ll      $t0, 0($a0)         # load linked value into $t0 should be zero to aquire a lock
        bnez    $t0, trylk          # if lock not available, try again 
        sc      $t1, 0($a0)         # try to set lock
        beqz    $t1, trylk          # branch to trylk if lock was not aquired
        lw		$t2, 0($a1)		    # load shvar into $t2 
        slt     $t3, $t2, $a2       # t3 = 1, if (shvar < x) else t3 = 0
        beqz    $t3, skip           # skip swapping if shvar > x
        sw		$a2, 0($a1)		    # else swap values
skip:
        sw      $0, 0($a0)          # release lock
