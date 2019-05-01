main:
    # load $t0 with 0XAAAAAAAA
    lui $t0, 0xAAAA
    ori $t0, 0xAAAA
    # load $t1 with 0X12345678
    lui $t1, 0x1234
    ori $t1, 0x5678

    # now problem 2-19-1
    sll $t2, $t0, 12
    or $t2, $t2, $t1