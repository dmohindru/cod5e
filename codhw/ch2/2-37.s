c code for problem
code for problem 2-37

int convert(char *str) {
    int is_neg, number = 0;
    if (*str == 45) //-ve sign {
            is_neg = 1;
    }
    str++;
    while(*str) {
        if (*str < 48 || *str > 57) {   //invalid character 
            return -1;
        }
        else {
            number = number * 10;   // move 1 digit to left
            number = number + (*str - 48)
        }
        str++;
    }
    if (is_neg && number > 0)
        number = -number;
    return number;
}

convert:
        add		$v0, $0, $0		# initalize return value to zero
        addi    $t3, $0, 10     # set base in register t3
start:
        lb		$t0, 0($a0)		# load byte pointed by $a0
        beq		$t0, $0, end	# jump if its a null terminating character
        addi	$t0, $t0, -48	# subtract ascii code of zero (48) for byte just read
        bltz    $t0, error      # if ascii code of byte is less than zero its not a number
        addi    $t1, $t0, -9    # check if byte is within range of numeric ascii code
        bgtz    $t1, error      # if ascii code of byte is greater than nine its not a number
        mult	$v0, $v0, $t3	# shift return value 1 digit to left
        add     $v0, $v0, $t0   # concatenate number to result
        addi	$a0, $a0, 1		# point to next byte in string
        j		start			# jump to start of loop
end:
        jr		$ra				# return to caller
error:
        addi    $v0, $0, -1     # for error condition set return value to -1
        jr      $ra             # return to caller
