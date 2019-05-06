f:
        addi	$sp, $sp, -12   # adjust stack for 3 items
        sw	$ra, 8($sp)	# save return address
        sw      $s1, 4($sp)     # save register s1
        sw      $s0, 0($sp)     # save register s0

        add     $s1, $a3, $0    # move a3 to s1
        add     $s0, $a2, $0    # move a2 to s0 

        # call func (a, b)
        jal	func            # call func
        add	$a0, $v0, $0    # set first argument for next function call
        add     $a1, $s1, $s0   # set second argument for next function call
        jal     func            # call func

        lw	$s0, 0($sp)	# restore store register s0
        lw      $s1, 4($sp)     # restore store register s1
        lw      $ra, 8($sp)     # restore return address
        addi    $sp, $sp, 12    # adjust stack to pop old values
        jr	$ra		# jump to caller
    