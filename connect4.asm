# connect 4 Program written in MIPS
# Program written by: Bryan Tran, Clayton Breckel, Brian Bell, Hamza Vorel

# ******************************************************************************************************************** #
.data # Initalizing Data HERE
    chars: 	.byte '_' 'x' 'o'   		# This is the notation we are using
    charBreak: 	.byte '|'			# This is to break the board up to make it easier to see
    column: 	.byte 6				# 6 Bytes for the Column (This is correct according to the game)
    row: 	.byte 7				# 7 Bytes for the Row
    arr: 	.space 56 			# Reserve a ROW * COLUMN array size
# ******************************************************************************************************************** #
.text # Actual CODE start HERE
main:
    move $a0, $zero				# Initialize a0 to be 0 (JUST TO BE SAFE)
    jal fillEmpty				# jump to fillEmpty
    j loop					# Once empty spots are filled, loop the board
    j exit					# Once game is over, jump to exit (exit program)
   
fillEmpty: # This will fill in the empty blocks with 0's
    beq $a0, 56, ra				# IF $a0 == 56, jump to ra (to get out of this)
    sb $zero, arr($a0)				# store 0 into the element of the array
    addi $a0, $a0, 1				# increment array by 1 (byte alligned)
    j fillEmpty					# keep looping through
   
loop: # Repeatedly print out the board
    jal printBoard				# Jump to printBoard
    j exit					# After printing out the board, exit (WE will fix this later)
   
printBoard: # Print out the board
    sb $ra,($sp)
    addi $sp, $sp, -4 				# Store the return address (to line 27)
    lb $s0, row					# $s0 contains number of ROWS
    lb $s1, column				# $s1 contains number of COLUMNS
    li $s2, 0					# clear out $s2 and $a1 (TO BE SAFE)
    li $a1, 0					# $a1 is basically a 'counter', counts the number of rows
    j printRow
    jr $ra
   
printRow:  
    beq $a1, $s0, ra				# If counter == the number of rows, return to line (to line 27)
    li $v0, 11					# Load 11 into $v0 (11 is print character in syscall menu)
    lb $t0, arr($a1)				# Content of the element of this ROW will be placed into $t0
    lb $a0, chars($t0)				# $t0 is either 0, 1, or 2, and this will print out _, x, or o
    syscall
    lb $a0, charBreak				# After that character is printed, this will print a break '|' between each one
    syscall
    addi $a1, $a1, 1				# Increment the row number
    j printRow					# repeat until branch condition is met (prints 7 times)
   
nl: # This is just to print out a new line, whenever we need it
    li $v0, 11					
    li $a0, '\n'
    syscall
    jr $ra
   
ra: # This is just a convenient jr $ra command when we need it
    jr $ra
 
exit: # This ends the program
    li $v0, 10
    syscall