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
    }
    if (is_neg && number > 0)
        number = -number;
    return number;
}