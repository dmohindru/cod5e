f:
        addi	$sp, $sp, -12   # adjust stack for 3 items
        sw		$ra, 8($sp)	    # save return address
        sw      $a1, 4($sp)     # save second argument in $a1
        sw      $a0, 0($sp)     # save first argument in $a0

        # call func (a, b)
        jal		func            # call func
        add		$a0, $v0, $0    # set first argument for next function call
        add     $a1, $a2, $a3   # set second argument for next function call
        jal     func            # call func

        lw		$a0, 0($sp)		# restore first argument in $a0
        lw      $a1, 4($sp)     # restore second argument in $a1
        lw      $ra, 8($sp)     # restore return address
        addi    $sp, $sp, 12    # adjust stack to pop old values
        jr		$ra				# jump to caller
         
    