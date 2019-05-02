# extract bits 16 to 11 from t1
srl $t2, $t0, 11
# put bits in their right place
sll $t2, $t2, 26
# prepare bit mask for bits 31-26
lui $t3, 0x3FFF
ori $t3, $t3, 0xFFFF
# clear bits 31-26 in t1
and $t1, $t1, $t3
# set bits 31-26 in t1
or $t1, $t1, $t0