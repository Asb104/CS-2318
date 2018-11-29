###############################################################################
# Title: Assign02P3                   Author: Justin Vineyard
# Class: CS 2318-003, Fall 2018       Submitted: 11/1/2018
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################
.data
a1:			.space 48
a2:			.space 48
a3:			.space 48
einStr: .asciiz "Enter integer #"
moStr: .asciiz "Max of "
ieStr: .asciiz " ints entered..."
emiStr: .asciiz "Enter more ints? (n or N = no, others = yes) "
begA1Str: .asciiz "Beginning a1: "
procA1Str: .asciiz "processed a1: "
commA2Str: .asciiz "          a2: "
commA3Str: .asciiz "          a3: "
dacStr: .asciiz "Do another case? (n or N = no, others = yes) "
dlStr: .asciiz "=================================="
byeStr: .asciiz "bye..."
.text
.globl main
main:
		li $v1, 'y'
		j WTest1
               #goto WTest1;
begW1:       
                 # used1 = 0;
                 # used2 = 0;
                 # used3 = 0;
                 # hopPtr1 = a1;
                 # //while (reply != 'n' && reply != 'N')
                 # goto WTest2;
                 li $t1, 0
                 li $t2, 0
                 li $t3, 0
                 la $t5, a1
                 j WTest2
begW2:         
		
                    # cout << einStr;
                    li $v0, 4
                    la $a0, einStr
                    syscall
                    # cout << (used1 + 1);
                    li $v0, 1
                    addi $a0, $t1, 1
                    syscall
                    # cout << ':' << ' ';
                    li $a0, ':'
                    li $v0, 11
                    syscall
                    li $a0, ' '
                    syscall
                    # cin >> *hopPtr1;
                    li $v0, 5
                    syscall
                    sw $v0, 0($t5)
                    # ++used1;
                    addi $t1, $t1, 1
                    # ++hopPtr1;
                    addi $t5, $t5, 4
                    # //if (used1 < 12)
                    # if (used1 >= 12) goto elseI1;
                    li $t0, 12
                    bge $t1, $t0 elseI1

                    
begI1:           #  {
                        #cout << emiStr;
                        li $v0, 4
                        la $a0, emiStr
                        syscall
                       # cin >> reply;
                       li $v0, 12
                       syscall
                       move $v1, $v0
                       li $t0, '\n'
                       li $v0, 11
                       syscall
                   #  goto endI1;
                   j endI1
#//                   }
elseI1:#//             else
#//                   {
                       # cout << moStr << 12 << ieStr << endl;
                       li $v0, 4
                       la $a0, moStr
                       syscall
                       li $v0, 1
                       li $a0, 12
                       syscall
                       li $v0, 4
                       la $a0, ieStr
                       syscall
                       li $a0, '\n'
                       li $v0, 11
                       syscall
                       
                       # reply = 'n';
                       li $v1, 'n'
endI1:#//             }
WTest2:#//         }
                  #////if (reply != 'n' && reply != 'N') goto begW2;
                 # if (reply == 'n') goto xitW2;
                 li $t0, 'n'
                 beq $v1, $t0, xitW2
                  #if (reply != 'N') goto begW2;
                  li $t0, 'N'
                  bne $v1, $t0, begW2
xitW2:
                  #cout << endl;
		li $a0, '\n'
		li $v0, 11
		syscall
                 # //if (used1 > 0)
                 # if (used1 <= 0) goto endI2;
                 ble $t1, $zero, endI2
begI2:#//          {
                    # total = 0;
                    li $t9, 0
                   #  //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                    # hopPtr1 = a1;
                    # endPtr1 = a1 + used1;
                    la $t5, a1
                    sll $t0, $t1, 2
                    add $a1, $t5, $t0
                    j FTest1
                     #goto FTest1;
begF1:#//             {
                        #target = *hopPtr1;
                        lw $t4, 0($t5)
                       # total += target;
                       add $t9, $t9, $t4
                       # //if (target % 2 == 1)
                       # ////if (target % 2 != 1) goto elseI3;
                       # if ( (target & 1) != 1) goto elseI3;
                       andi $a0, $t4, 1
                       beqz $t0, elseI3
begI3:#//                {
                           #hopPtr3 = a3 + used3 - 1;
                           la $t0, a3
                           sll $t7, $t3, 2
                           addi $t7, $t7, -4
                           add $t7, $t7, $t0
                           #endPtr3 = a3;
                           la $a3, a3
                           #//while (hopPtr3 >= endPtr3)
                          # goto WTest3;
                          j WTest3
begW3:#//                   {
                             # //if (*hopPtr3 > target)
                              #if (*hopPtr3 <= target) goto elseI4;
                              lw $t0, 0($t7)
                              ble $t0, $t4, elseI4
begI4:#//                      {
                                 #*(hopPtr3 + 1) = *hopPtr3;
                                 lw $t0, 0($t7)
                                 sw $t0, 4($t7)
                                 #--hopPtr3;
                                 addi $t7, $t7, -4
                                 j endI4
                              #goto endI4;
#//                            }
elseI4:#//                      else
#//                            {
#                                 //break;
#                                 goto brk1;
                                 j brk1
endI4:#//                      }
WTest3:#//                  }
                          # if (hopPtr3 >= endPtr3) goto begW3;
                          bge $t7, $a3, begW3
brk1:
                         #  *(hopPtr3 + 1) = target;
                         sw $t4, 4($t7)
                          # ++used3;
                          addi $t3, $t3, 1
                          j endI3
                        #goto endI3;
#//                      }
elseI3:#//                else
#//                      {
                          # hopPtr2 = a2;
                          la $t6, a2
                           #endPtr2 = a2 + used2;
                           sll $a2, $t2, 2
                           add $a2, $t6, $a2
                           #//while (hopPtr2 < endPtr2)
                          # goto WTest4;
                          j WTest4
begW4:#//                   {
                            #  //if (*hopPtr2 >= target)
                             # if (*hopPtr2 < target) goto elseI5;
                             lw $t0, 0($t6)
                             blt $t0, $t4, elseI5
begI5:#//                      {
                                # hopPtr21 = endPtr2;
                                # ///while (hopPtr21 > hopPtr2)
                                move $t8, $a2
                                 #goto WTest5;
                                 j WTest5
begW5:#//                         {
                                   # *hopPtr21 = *(hopPtr21 - 1);
                                   lw $t0, -4($t8)
                                   sw $t0, 0($t8)
                                    #--hopPtr21;
                                    addi $t8, $t8, -4
WTest5:#//                        }
                                 #if (hopPtr21 > hopPtr2) goto begW5;
				bgt $t8, $t6, begW5
                                 #///break;
                                # goto brk2;
                                j brk2
                         #  ///goto endI5; // unreacheable
#//                            }
elseI5:#//                      else
#//                            {
                                # ++hopPtr2;
                                addi $t6, $t6, 4
endI5:#//                      }
WTest4:#//                  }
                           #if (hopPtr2 < endPtr2) goto begW4;
                           blt $t6, $a2, begW4
brk2:
                           #*hopPtr2 = target;
                           sw $t4, 0($t6)
                          # ++used2;
                          addi $t2, $t2, 1
endI3:#//                }
                       # mean = total/used1;
                       div $t8, $t9, $t1
                   #  ++hopPtr1;
                   addi $t5, $t5, 4
FTest1:#//            }
                     #if (hopPtr1 < endPtr1) goto begF1;
                     blt $t5, $a1, begF1

                     #cout << begA1Str;
                     li $v0, 4
                     la $a0, begA1Str
                     syscall
                     #//if (used1 > 0)
                     #if (used1 <= 0) goto endI6;
                     ble $t1, $zero, endI6
begI6:#//             {
                       # hopPtr1 = a1;
                       la $t5, a1
                       
                        #endPtr1 = a1 + used1;
                        sll $a1, $t1, 2
                        add $a1, $a1, $t5
#//                      do
begDW1:#//               {
                           #cout << *hopPtr1 << ' ' << ' ';
                            li $v0, 1
                           lw $a0, 0($t5)
                           syscall
                           li $v0, 11
                           li $a0, ' '
                           syscall
                           li $v0, 11
                           li $a0, ' '
                           syscall
                           #++hopPtr1;
                           addi $t5, $t5, 4
DWTest1:#//              }
                       # //while (hopPtr1 < endPtr1);
                       # if (hopPtr1 < endPtr1) goto begDW1;
                       blt $t5, $a1, begDW1
endI6:#//             }
                     #cout << endl;
			li $a0, '\n'
			li $v0, 11
			syscall
                     #cout << commA2Str;
                     li $v0, 4
                     la $a0, commA2Str
                     syscall
                     #//if (used2 > 0)
                     #if (used2 <= 0) goto endI7;
                     ble $t2, $zero, endI7
begI7:#//             {
                        #hopPtr2 = a2;
                        la $t6, a2
                        #endPtr2 = a2 + used2;
                        sll $a0, $t2, 2
                        add $a2, $t6, $a0
#//                      do
begDW2:#//               {
                          # cout << *hopPtr2 << ' ' << ' ';
                          li $v0, 1
                           lw $a0, 0($t6)
                           syscall
                           li $v0, 11
                           li $a0, ' '
                           syscall
                           li $v0, 11
                           li $a0, ' '
                           syscall
                          
                           #++hopPtr2;
                           addi $t6, $t6, 4
DWTest2:#//              }
                        #//while (hopPtr2 < endPtr2);
                        #if (hopPtr2 < endPtr2) goto begDW2;
                        blt $t6, $a2, begDW2
endI7:#//             }
                    # cout << endl;
			li $a0, '\n'
			li $v0, 11
			syscall
                     #cout << commA3Str;
                     li $v0, 4
                     la $a0, commA3Str
                    # //if (used3 > 0)
                    # if (used3 <= 0) goto endI8;
                    ble $t3, $zero, endI8
begI8:#//             {
                        #hopPtr3 = a3;
                        la $t7, a3
                        #endPtr3 = a3 + used3;
                        sll $a3, $t3, 2
                        add $a3, $t7, $a3
#//                      do
begDW3:#//               {
                          # cout << *hopPtr3 << ' ' << ' ';
                          lw $a0, 0($t7)
                          li $v0, 1
                          syscall
                           li $a0, ' '
                           li $v0, 11
                           syscall
                           li $a0, ' '
                           li $v0, 11
                           syscall
                          # ++hopPtr3;
                          addi $t7, $t7, 4
DWTest3:#//              }
                        #//while (hopPtr3 < endPtr3);
                        #if (hopPtr3 < endPtr3) goto begDW3;
                        blt $t7, $a3, begDW3
endI8:#//             }
                     #cout << endl;
                           li $a0, '\n'
                           li $v0, 11
                           syscall
                     #hopPtr1 = a1;
                     la $t5, a1
                    # hopPtr2 = a2;
                    la $t6, a2
                     #hopPtr3 = a3;
                     la $t7, a3
                     #endPtr2 = a2 + used2;
                     sll $a2, $t2, 2
                     add $a2, $t6, $a2
                     #endPtr3 = a3 + used3;
                     sll $a3, $t3, 2
                     add $a3, $t7, $a3
                     #//while (hopPtr2 < endPtr2 && hopPtr3 < endPtr3)
                     
                    # goto WTest6;
                    j WTest6
begW6:#//             {
                       # //if (*hopPtr2 < *hopPtr3)
                       # if (*hopPtr2 >= *hopPtr3) goto elseI9;
                       lw $t0, 0($t6)
                       lw $v1, 0($t7)
                       bge $t0, $v1, elseI9
begI9:#//                {
                         #  *hopPtr1 = *hopPtr2;
                         lw $v0, 0($t6)
                         sw $v0, 0($t5)
                          # ++hopPtr2;
                          addi $t6, $t6, 4
                        #goto endI9;
                        j endI9
#//                      }
elseI9:#//                else
#//                      {
                           #*hopPtr1 = *hopPtr3;
                           lw $t0, 0($t7)
                           sw $t0, 0($t5)
                           #++hopPtr3;
                           addi $t7, $t7, 4
endI9:#//                }
                       # ++hopPtr1;
                       addi $t5, $t5, 4
WTest6:#//            }
                     #////if (hopPtr2 < endPtr2 && hopPtr3 < endPtr3) goto begW6;
                    # if (hopPtr2 >= endPtr2) goto xitW6;
                    bge $t6, $a2, xitW6
                     #if (hopPtr3 < endPtr3) goto begW6;
                     blt $t7, $a3, begW6
xitW6:
                     #//while (hopPtr2 < endPtr2)
                     #goto WTest7;
                     j WTest7
begW7:#//             {
                       # *hopPtr1 = *hopPtr2;
                       lw $t0, 0($t6)
                       sw $t0, 0($t5)
                        #++hopPtr2;
                        addi $t6, $t6, 4
                        #++hopPtr1;
                        addi $t5, $t5, 4
WTest7:#//            }
                     #if (hopPtr2 < endPtr2) goto begW7;
			blt $t6, $a2, begW7
                     #//while (hopPtr3 < endPtr3)
                    # goto WTest8;
                    j WTest8
begW8:#//             {
                       # *hopPtr1 = *hopPtr3;
                       lw $t0, 0($t7)
                       sw $t0, 0($t5)
                        #++hopPtr3;
                        addi $t7, $t7, 4
                        #++hopPtr1;
                        addi $t5, $t5, 4
WTest8:#//            }
                    # if (hopPtr3 < endPtr3) goto begW8;
			blt $t7, $a3, begW8
                     #hopPtr2 = a2;
                     la $t6, a2
                     #hopPtr3 = a3;
                     la $t7, a3
                     #used2 = 0;
                     li $t2, 0
                     #used3 = 0;
                     li $t3, 0
                     #//for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                    # hopPtr1 = a1;
                    la $t5, a1
                     #endPtr1 = a1 + used1;
                     sll $a1, $t1, 2
                     add $a1, $t5, $a1
                     #goto FTest2;
                     j FTest2
begF2:#//             {
                        #target = *hopPtr1;
                        lw $t4, 0($t5)
                       # //if (target < mean)
                       # if (target >= mean) goto elseI10;
                       bge $t4, $t8, elseI10
begI10:#//               {
                          # *hopPtr2 = target;
                          sw $t4, 0($t6)
                           #++used2;
                           addi $t2, $t2, 1
                          # ++hopPtr2;
                          addi $t6, $t6, 4
                        #goto endI10;
                        j endI10
#//                      }
elseI10:#//               else
#//                      {
                          # //if (target > mean)
                           #if (target <= mean) goto endI11;
                           ble $t4, $t8, endI11
begI11:#//                  {
                              #*hopPtr3 = target;
                              sw $t4, 0($t7)
                              #++used3;
                              addi $t3, $t3, 1
                              #++hopPtr3;
                              addi $t7, $t7, 4
endI11:#//                  }
endI10:#//               }
                    # ++hopPtr1;
                    addi $t5, $t5, 4
FTest2:#//            }
                    # if (hopPtr1 < endPtr1) goto begF2;
			blt $t5, $a1, begF2
                    # cout << procA1Str;
                    li $v0, 4
                    la $a0, procA1Str
                    syscall
                    # //if (used1 > 0)
                     #if (used1 <= 0) goto endI12;
                     ble $t1, $zero, endI12
begI12:#//            {
                       # hopPtr1 = a1;
                       la $t5, a1
                        #endPtr1 = a1 + used1;
                        sll $a1, $t1, 2
                        add $a1, $t5, $a1
                      #  //do
begDW4:#//               {
                           #cout << *hopPtr1 << ' ' << ' ';
                           li $v0, 1
                           lw $a0, 0($t5)
                           syscall
                            li $a0, ' '
                           li $v0, 11
                           syscall
                           li $a0, ' '
                           li $v0, 11
                           syscall
                          # ++hopPtr1;
                          addi $t5, $t5, 4
DWTest4:#//             #  }
                       # //while (hopPtr1 < endPtr1);
                        #if (hopPtr1 < endPtr1) goto begDW4;
                        blt $t5, $a1, begDW4
endI12:#//            }
                    # cout << endl;
                       	  li $a0, '\n'
                          li $v0, 11
                          syscall
                    # cout << commA2Str;
                    li $v0, 4
                    la $a0, commA2Str
                    syscall
                     #//if (used2 > 0)
                     #if (used2 <= 0) goto endI13;
                     ble $t2, $zero, endI13
begI13:#//            {
                      #  hopPtr2 = a2;
                      la $t6, a2
                        #endPtr2 = a2 + used2;
                        sll $a2, $t2, 2
                        add $a2, $t6, $a2
                       # //do
begDW5:#//               {
                           #cout << *hopPtr2 << ' ' << ' ';
                           li $v0, 1
                           lw $a0, 0($t6)
                           syscall
                            li $a0, ' '
                           li $v0, 11
                           syscall
                           li $a0, ' '
                           li $v0, 11
                           syscall
                          # ++hopPtr2;
                          addi $t6, $t6, 4
DWTest5:#//               }
                      #  //while (hopPtr2 < endPtr2);
                       # if (hopPtr2 < endPtr2) goto begDW5;
                       blt $t6, $a2, begDW5
endI13:#//            }
                    # cout << endl;
			li $t0, '\n'
			li $v0, 11
			syscall
                     #cout << commA3Str;
                     li $v0, 4
                     la $t0, commA3Str
                     #//if (used3 > 0)
                     #if (used3 <= 0) goto endI14;
                     ble $t3, $zero, endI14
begI14:#//            {
                        #hopPtr3 = a3;
                        la $t7, a3
                        #endPtr3 = a3 + used3;
                        sll $a3, $t3, 2
                        add $a3, $t7, $a3
                       # //do
begDW6:#//               {
                          # cout << *hopPtr3 << ' ' << ' ';
                          lw $t0, 0($t7)
                          li $v0, 1
                          syscall
                           li $a0, ' '
                           li $v0, 11
                           syscall
                           li $a0, ' '
                           li $v0, 11
                           syscall
                         #  ++hopPtr3;
                         addi $t7, $t7, 4
DWTest6:#//               }
                       # //while (hopPtr3 < endPtr3);
                        #if (hopPtr3 < endPtr3) goto begDW6;
                        blt $t7, $a3, begDW6
endI14:#//            }
                    # cout << endl;
                    li $t0, '\n'
                    li $v0, 11
                    syscall
endI2:#//          }

                  #cout << endl;
                  li $t0, '\n'
                  li $v0, 11
                 # cout << dacStr;
                 li $v0, 4
                 la $t0, dacStr
                  #cin >> reply;
                  li $v0, 12
                  syscall
                  move $v1, $v0
                  #cout << endl;
                  li $t0, '\n'
                  li $v0, 11
                  syscall
WTest1:#//      }
              # ////if (reply != 'n' && reply != 'N') goto begW1;
             # if (reply == 'n') goto xitW1;
             li $t0, 'n'
             beq $v1, $t0, xitW1
               #if (reply != 'N') goto begW1;
               li $t0, 'N'
               bne $v1, $t0, begW1
xitW1:
               #cout << dlStr << '\n';
               li $v0, 4
               la $t0, dlStr
               syscall
               li $t0, '\n'
               li $v0, 11
               syscall
               #cout << byeStr << '\n';
               li $v0, 4
               la $t0, byeStr
               syscall
               li $t0, '\n'
               li $v0, 11
               syscall
               #cout << dlStr << '\n';
		li $v0, 4
               la $t0, dlStr
               syscall
               li $t0, '\n'
               li $v0, 11
               syscall
               #return 0;
               li $v0, 10
               syscall
#}

