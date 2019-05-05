# Read page 101 for solution hint
fib:
        addi	$sp, $sp, -12   # adjust stack for 3 items
        sw		$ra, 8($sp)		# save return address
        sw      $s0, 4($sp)     # save register $s0
        sw      $a0, 0($sp)     # save the argument n
        # test for n == 0
        bgt		$a0, $0, L1     # branch to L1 if n > 0 
        add		$v0, $0, $0     # set return value to zero
        j       L3              # jump to prepare for a return
        # test for n == 1
L1:     addi	$t0, $0, 1      # set t0 = 1
        bne     $t0, $a0, L2    # branch to L2 if n > 1
        addi    $v0, $0, 1      # set return value to 1
        j       L3              # jump to prepare for a return
        # now compute fib(n−1) + fib(n−2)
L2:     addi    $a0, $a0, -1    # compute n = n - 1
        jal		fib             # call fib with n-1
        add     $s0, $v0, $0    # save return value to s0
        addi    $a0, $a0, -1    # compute n = n -2
        jal     fib             # call fib with n-2
        add     $v0, $v0, $s0   # add return value of two previous call
L3:        
        lw		$a0, 0($sp)     # restore argument n
        lw      $a0, 4($sp)     # restore a0
        lw      $ra, 8($sp)     # restore return value
        addi    $sp, $sp, 12    # adjust stack to pop old values
        jr      $ra             # return to caller
        
        

        		
         
        
        