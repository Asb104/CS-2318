
#include <iostream>
using namespace std;

#int a1[12],
    a2[12],
    a3[12];
char einStr[]    = "Enter integer #";
char moStr[]     = "Max of ";
char ieStr[]     = " ints entered...";
char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[]  = "beginning a1: ";
char procA1Str[] = "processed a1: ";
char commA2Str[] = "          a2: ";
char commA3Str[] = "          a3: ";
char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
char dlStr[]     = "================================";
char byeStr[]    = "bye...";

int main()
{
               char reply;
               int used1,
                   used2,
                   used3,
                   target,
                   total,
                   mean,
                   *hopPtr1,
                   *hopPtr2,
                   *hopPtr21,
                   *hopPtr3,
                   *endPtr1,
                   *endPtr2,
                   *endPtr3;

               cout << endl;
               reply = 'y';
goto WTest1; //while(reply != 'n' && reply != 'N') line 313
begW1://       {
                  used1 = 0;
                  used2 = 0;
                  used3 = 0;
                  hopPtr1 = a1;
goto WTest2;//    while (reply != 'n' && reply != 'N')  line 65
begW2://          {
                     cout << einStr;
                     cout << (used1 + 1);
                     cout << ':' << ' ';
                     cin >> *hopPtr1;
                     ++used1;
                     ++hopPtr1;
                     // if (used1 < 12) negated
if(used1  >=  12) goto else1;  //line 58
begI1://             {
                        cout << emiStr;
                        cin >> reply;
goto endI1; //line 63
//                   }
else1://             else
//                   {
                        cout << moStr << 12 << ieStr << endl;
                        reply = 'n';
endI1://             }
endW2://          }
WTest2:          
if (reply == 'n' || reply =='N') goto xitW2;  //line 68
if (reply != 'N' || reply == 'n') goto begW2;  //line  45
xitW2:

                  cout << endl;

                  // if (used1 > 0) negated
if (used1 <= 0) goto endI2;     // line 306   
begI2://          {
                     total = 0;
                     //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
goto FTest1;   //
begF1://             {
                        target = *hopPtr1;
                        total += target;
                        //if (target % 2 == 1) negated
if (target % 2 != 1) goto else3; // line 109
begI3://                {
                           hopPtr3 = a3 + used3 - 1;
                           endPtr3 = a3;
                           //while (hopPtr3 >= endPtr3)
goto WTest3;// 103
begW3://                   {
                              //if (*hopPtr3 > target)
if (*hopPtr3 <= target) goto else4; // 98
begI4://                      {
                                 *(hopPtr3 + 1) = *hopPtr3;
                                 --hopPtr3;
goto endI4; //102
//                            }
else4://                      else
//                            {
brk1://                          break;
goto endW3; //104
endI4://                      }
WTest3:
if (*hopPtr3 > target) goto begW3; //90
endW3://                   }
                           *(hopPtr3 + 1) = target;
                           ++used3;
goto endI3; //141
//                      }
else3://                else
//                      {
                           hopPtr2 = a2;
                           endPtr2 = a2 + used2;
                           //while (hopPtr2 < endPtr2)
goto WTest4; //136
begW4://                   {
                              //if (*hopPtr2 >= target) negate
if (*hopPtr2 < target) goto else5; //132
begI5://                      {
                                 hopPtr21 = endPtr2;
                                 //while (hopPtr21 > hopPtr2)
goto WTest5; //126
begW5://                         {
                                    *hopPtr21 = *(hopPtr21 - 1);
                                    --hopPtr21;
WTest5:                          
if (hopPtr21  > hopPtr2) goto begW5; //123
endW5://                         }
brk2://                          break;
goto endW4; //138
//                            }
else5://                       else
//                            {
                                 ++hopPtr2;
endI5://                      }
WTest4:                   
if (hopPtr2 < endPtr2) goto begW4;  //116
endW4://                   }
                           *hopPtr2 = target;
                           ++used2;   
endI3://                }
                        mean = total/used1;
                        ++hopPtr1;
FTest1:              
if (hopPtr1 < endPtr1) goto begF1; //80
endF1://             }

                     cout << begA1Str;
                     //if (used1 > 0) negate
if (used1 <= 0) goto endI6; //161
begI6://             {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        //do
begDW1://               {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
endDW1://               }
DWTest1:                
if (hopPtr1 < endPtr1) goto begDW1; //155
endI6://             }
                     cout << endl;

                     cout << commA2Str;
                     //if (used2 > 0)negate
if (used2 <= 0) goto endI7; //177
begI7://             {
                        hopPtr2 = a2;
                        endPtr2 = a2 + used2;
                        //do
begDW2://               {
                           cout << *hopPtr2 << ' ' << ' ';
                           ++hopPtr2;
endDW2://               }
DWTest2:               
if (hopPtr2 < endPtr2) goto begDW2; //171
endI7://             }
                     cout << endl;

                     cout << commA3Str;
                     //if (used3 > 0) negate
if (used3 <= 0) goto endI8; //193
begI8://             {
                        hopPtr3 = a3;
                        endPtr3 = a3 + used3;
                        //do
begDW3://               {
                           cout << *hopPtr3 << ' ' << ' ';
                           ++hopPtr3;
endDW3://               }
DWTest3:               
if  (hopPtr3 < endPtr3) goto begDW3; //187
endI8://             }
                     cout << endl;

                     hopPtr1 = a1;
                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     endPtr2 = a2 + used2;
                     endPtr3 = a3 + used3;
                     //while (hopPtr2 < endPtr2 && hopPtr3 < endPtr3)
goto WTest6; //218
begW6://             {
                        //if (*hopPtr2 < *hopPtr3) negate
if (*hopPtr2 >= *hopPtr3) goto else9; //211
begI9://                {
                           *hopPtr1 = *hopPtr2;
                           ++hopPtr2;
goto endI9; //215
//                      }
else9://                    else
//                      {
                           *hopPtr1 = *hopPtr3;
                           ++hopPtr3;
endI9://                }
                        ++hopPtr1;
endW6://             }
WTest6:             
if (hopPtr2 >= endPtr2) goto xitW6; //221
if (hopPtr3 < endPtr3) goto begW6; //203
xitW6:   
                     //while (hopPtr2 < endPtr2)
goto WTest7;  //228
begW7://             {
                        *hopPtr1 = *hopPtr2;
                        ++hopPtr2;
                        ++hopPtr1;
WTest7:              
if (hopPtr2 < endPtr2) goto begW7;  //224     
endW7://             }
                     //while (hopPtr3 < endPtr3)
goto WTest8; //237
begW8://             {
                        *hopPtr1 = *hopPtr3;
                        ++hopPtr3;
                        ++hopPtr1;
WTest8:             
if (hopPtr3 < endPtr3) goto begW8;  //233
endW8://             }

                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     used2 = 0;
                     used3 = 0;
                     //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
goto FTest2; //269
begF2://             {
                        target = *hopPtr1;
                        //if (target < mean) negate
if (target >= mean) goto else10;
begI10://               {
                           *hopPtr2 = target;
                           ++used2;
                           ++hopPtr2;
//                      }
else10://               else
//                      {
                           //if (target > mean) negate
if (target <= mean) goto endI11;
begI11://                  {
                              *hopPtr3 = target;
                              ++used3;
                              ++hopPtr3;
endI11://                  }
endI10://               }
                        ++hopPtr1;
FTest2:            
if (hopPtr1 < endPtr1) goto begF2; //249
endF2://             }

                     cout << procA1Str;
                     //if (used1 > 0) negate
if (used1 <= 0) goto endI12;  //286
begI12://             {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        //do
begDW4://               {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
endDW4://               }
DWTest4:               
if (hopPtr1 < endPtr1)goto begDW4;  //280
endI12://            }
                     cout << endl;

                     cout << commA2Str;
                     //if (used2 > 0) negate
if (used2 <= 0) goto endI13;  //302
begI13://            {
                        hopPtr2 = a2;
                        endPtr2 = a2 + used2;
                        //do
begDW5://               {
                           cout << *hopPtr2 << ' ' << ' ';
                           ++hopPtr2;
endDW5://               }
DWTest5:            
if (hopPtr2 < endPtr2) goto  begDW5;  //296
endI13://            }
                     cout << endl;

                     cout << commA3Str;
                     //if (used3 > 0) negate
if (used3 <= 0) goto endI14;  // 318
begI14://            {
                        hopPtr3 = a3;
                        endPtr3 = a3 + used3;
                        //do
begDW6://               {
                           cout << *hopPtr3 << ' ' << ' ';
                           ++hopPtr3;
endDW6://               }
DWTest6:
if (hopPtr3 < endPtr3) goto begDW6;//312
endI14://            }
                     cout << endl;
endI2://          }

                  cout << endl;
                  cout << dacStr;
                  cin >> reply;
                  cout << endl;
endW1://       }
WTest1:
if (reply == 'n'|| reply == 'N') goto xitW1;//330
if (reply != 'N'|| reply != 'n') goto begW1; //39
xitW1:

               cout << dlStr << '\n';
               cout << byeStr << '\n';
               cout << dlStr << '\n';

               return 0;
}


