#########################################
# Andrew Baker HW1 Part 4 Oct 17,2018   #
#########################################

# Prompt user to enter the integer scores for Exams 1, 2, and Final,
# read the scores,
# compute the weighted average score (using the following formula), and
# display a labeled output about the weighted average score.
# 
#   avgScore=512*(1/2558)*e1Score+614*(1/2048)*e2Score+(1/2)*feScore
############################ data segment ################################
.data
scorePrompt0:       .asciiz "Enter integer score for Exam 1: "
scorePrompt1:       .asciiz "Enter integer score for Exam 2: "
scorePrompt2:       .asciiz "Enter integer score for Final Exam: "
avgMsg:         .asciiz "The weighted average is:  "
############################ code segment ################################
            .text
            .globl main
main:
            ################################################
            #   Get the scores, store in $t0, $t1, $t2
            ################################################

         		   li $v0, 4
         		   la $a0, scorePrompt0    # prompt for a score
         		   syscall
         		   li $v0, 5
         		   syscall         # read an integer
         		   move $t0, $v0
	
        		    li $v0, 4
        		    la $a0, scorePrompt1    # prompt for a score
        		    syscall
        		    li $v0, 5
        		    syscall         # read an integer
            		    move $t1, $v0

          		  li $v0, 4
          		  la $a0, scorePrompt2    # prompt for a score
        		    syscall
          		  li $v0, 5
        		    syscall         # read an integer
        		    move $t2, $v0


         		   ################################################
         		   #   Compute weighted average, store in $t4
          		   ################################################

          		  # multiply e1Score by 512
          		  sll $t0, $t0, 9

         		   # divide e1score by 2558
         		   li $t5, 2558        
        		    div $t0, $t5             
        		    mflo $t0
            
        		    # multiply e2score by 614
       			     li $t5, 614        
       			     mul $t1, $t1, $t5
            
      			      # divide e2Score by 2048
      			      sra $t1, $t1, 11

      			      # divide feScore by 2
      			      sra $t2, $t2, 1

         			# li $v0, 1
				#move $a0, $t0
				#syscall

				#li $v0, 1
				#move $a0, $t1
				#syscall
			
				#li $v0, 1
				#move $a0, $t2
				#syscall
            

           		 li $t4, 0     # ensure $t4 is 0
          		  add $t4, $t1, $t4
          		  add $t4, $t2, $t4
          		  add $t4, $t0, $t4
            

         		li $v0, 4
          		  la $a0, avgMsg
          		  syscall
         		   li $v0, 1
          		  move $a0, $t4
          		  syscall

            		li $v0, 10      # graceful exit service
           		 syscall