# Connect 4 Program written in MIPS
# Creators : Bryan Tran, Clayton Breckel, Brian Bell, Hamza Vorel

.data
	top:    .asciiz " _ _ _ _ _ _ _\n"
	mid:    .asciiz "|_|_|_|_|_|_|_|\n"
	bot:    .asciiz "|_|_|_|_|_|_|_|\n"
	new:    .asciiz "|_|_|_|_|_|_|_|\n"
	prompt: .asciiz "\nPick a column: "
	win:    .asciiz "Nice, you won."
	lose:   .asciiz "Aww, you lost."
	tie:    .asciiz "Oh... It's a tie."
	repeat: .asciiz "Play again? 1 or 0: "
	grid:   .space 24
.text
	
print:  # Printing out the board
	li $v0, 4
	la $a0,top
	syscall
	li $v0, 4
	la $a0,mid
	syscall
	li $v0, 4
	la $a0,mid
	syscall
	li $v0, 4
	la $a0,mid
	syscall
	li $v0, 4
	la $a0,mid
	syscall
	li $v0, 4
	la $a0,new
	syscall
	li $v0, 4
	la $a0,bot
	syscall
	
	# Printing out prompt
	li $v0, 4
	la $a0, prompt
	syscall