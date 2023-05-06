include Shapes.inc
.286
.model small
.stack 100h

.data
;x and y coordinates
x dw 0
y dw 0

;variable count for keeping track of horizantal pixels
count dw 0

;variable lines for keeping track of vertical pixels
lines dw 0


level_completed db 'Level_completed$'
;Grid array for keeping track of candies on the grid
Grid_Array db 1,1,3,1,1,2,4 
           db 3,4,2,5,4,3,1
           db 1,1,4,5,2,1,4
           db 2,5,5,6,1,2,4
           db 5,4,4,1,5,4,2
           db 3,1,3,5,2,6,4
           db 2,3,3,1,2,4,6

Grid_Array_level_2  db 0,1,3,0,1,2,0
                    db 0,4,2,5,4,3,0
                    db 1,1,4,5,2,1,4
                    db 0,5,5,6,1,2,0
                    db 5,4,4,1,5,4,2
                    db 0,1,3,5,2,6,0
                    db 0,3,3,0,2,4,0


Grid_Array_level_3  db 1,1,3,0,1,2,4 
                    db 3,4,2,0,4,3,1
                    db 1,1,4,0,2,1,4
                    db 0,0,0,0,0,0,0
                    db 5,4,4,0,5,4,2
                    db 3,1,3,0,2,6,4
                    db 2,3,3,0,2,4,6

;variables for keeping track of candies to be displayed
no_of_candies_horizontal dw 0
no_of_candies_vertical dw 0
Candy_colour db 0

;Display page strings
Game_Name1 db "Welcome To$"
Game_Name2 db "!!!Candy Crush!!!$"
Player_Name_Message db "Enter Name:$"
Continue_Message db "Press Enter To Continue$"
Player_Name db 20 dup(?)
Player_Name_Label db "NAME:$"
Created_By db "Project Creators$"
C1 db "I19-1772 ABDULLAH$"
C2 db "I19-1796 MAJID MEHMOOD$"

;infinite loop variable
Infinite_loop dw 1

;Rules page strings
Rules_Message DB '!!!Rules of the Game!!!$'
Rule_1 DB '1.Match 3 Candies in a row to crush them.$'
Rule_2 DB '2.Upon crushing candies, points will be awarded.$'
Rule_3 DB '3.If candies do not match, they will not be crushed.$'



;starting coordinates of mouse click
X_start dw 0
Y_start dw 0

;ending coordinates of mouse click
X_end dw 0
Y_end dw 0

;box counter variable
Index_Counter_Start db 1
Index_Counter_End db 1
temp dw 0

;for swapping
temp1 db 0
temp2 db 0

;validity difference check
Up_diff db 0
Below_diff db 0
Left_diff db 0
Right_diff db 0

;variable for checking next 2 horizontal objects
Next1 db 0
Next2 db 0
Strat_Index db 0
End_Index db 0

;Level No strings
Level_1 DB 'LEVEL 1$'
Level_2 DB 'LEVEL 2$'
Level_3 DB 'LEVEL 3$'

;Player score variables
Score_Label db 'Score:$'
Player_Score_Level_1 dw 0
Player_Score_Level_2 dw 0
Player_Score_Level_3 dw 0
Playe_Toatl_Score dw 0
Candy_crushed db 0
L1p1 db 0
L1p2 db 0
L2p1 db 0
L2p2 db 0
L3p1 db 0
L3p2 db 0
t1p1 db 0
t1p2 db 0
Lvl1 db 3 dup('$')
Lvl2 db 3 dup('$')
Lvl3 db 3 dup('$')
Ttl db 3 dup('$')

;Player Move variables
Moves_Label db 'Moves Left:$'
Moves_left dw 2

;Moves label
Not_Valid_Move_Label db 'NOT VALID MOVE$'
Valid_Move_Label db 'CRUSHED$'

;Play again strings
Play_again_str1 db 'OOPS You ran out of moves.$'
Play_again_str2 db 'To Play again press ENTER. Press ESC to exit.$'

;candy replacement
Candy_Array_1 db 2,3,4
Candy_Array_2 db 1,4,3
Candy_Array_3 db 5,1,2
Candy_Array_4 db 3,5,1
Candy_Array_5 db 4,2,3
Rand_Array db 1,4,3,2,5,1,5
           db 3,2,4,5,3,2,1
           db 1,4,3,2,5,1,5
           db 2,5,1,3,2,4,5
           db 5,3,2,4,1,1,4
           db 5,1,3,2,4,5,3
           db 1,3,2,4,5,3,2

;db 1,4,3,2,5,1,5,3,4,2,5,1,3,2,4,5,3,2,1,5,3,2,4,1,1,4,3,2,5,1,5,3,4,2,5,1,3,2,4,5,3,2,1,5,3,2,4,1,1,4,3,2,5,1,5,3,4,2,5,1,3,2,4,5,3,2,1,5,3,2,4,1

Bomb_candy db 0

Level_1_Score db 'Level_1_Score: $'
Level_2_Score db 'Level_2_Score: $'
Level_3_Score db 'Level_3_Score: $'
Total_Score_end db 'Toatl_Score: $'

file db "Scores.txt",0

.code

main proc

;load data 
mov ax,@data
mov ds,ax

;loop for page one displaying landing page of the game
.while Infinite_loop >0

    ;open in video mode
    mov ah, 00h
    mov bh,00
    mov al, 14
    int 10h

    ;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

    ;draw boundary box
    Draw_Opening_Box x,y,count,lines

    ;draw candies on front page
    Draw_candies_on_front_page x,y,count,lines

    ;draw Game Title Box on front page
    Draw_Game_Title_Box x,y,count,lines

    ;draw Game Name on front page
    Draw_Game_Name x,y,Game_Name1,Game_Name2

    ;draw Name box on front page
    Draw_Name_Box x,y,count,lines,Player_Name_Message,Continue_Message,Created_By,C1,C2

    ;Display Creator's name

    ;taking player name input 
    MOV AH,02H
    MOV BX,0
    MOV DH, 16 ;Row Number
    MOV DL, 32 ;Column Number
    INT 10H

    ;starting loop for input of name
    mov si,offset Player_Name
    .while count <=50

        mov ah,01h
        int 21h

        ;checking if enter is pressed
        cmp al,13
        je exit

        mov [si],al
        inc si
        inc count

    .endw

    exit:
    ;putting $ at the end of the name string
    mov bl,36
    mov [si],bl
    ;moving to the next page
    jmp Rules

.endw

Rules:

.while Infinite_loop >0

    mov ah, 00h
    mov bh,01
    mov al, 14
    int 10h

    ;intialize variable
        mov count,0
        mov lines,0
        mov x,0
        mov y,0

    ;draw boundary box
    Draw_Opening_Box x,y,count,lines

    ;Display rules of the game
    Print_Rules Rules_Message,Rule_1,Rule_2,Rule_3,Continue_Message

    mov ah,01h
    int 21h

    ;checking if enter is pressed
    cmp al,13
    je Grid

.endw

;=================================================level 1 design of the game=============================================

Grid:
mov Player_Score_Level_1,0
mov Moves_left,5

mov ah, 00h
mov bh,02
mov al, 14
int 10h

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

;draw boundary box
Draw_Opening_Box x,y,count,lines


;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
;Drawing Grid
Draw_Grid x , y , lines, count

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
    mov no_of_candies_horizontal,0
    mov no_of_candies_vertical,0

;Populating the Grid with candies
Draw_Candies_On_Grid count,lines,x,y,Grid_Array,no_of_candies_vertical,no_of_candies_horizontal,Candy_colour

.while Infinite_loop > 0

;Drawing Level No
Print_Level_1 Level_1

;Drawing Name
Print_NAME Player_Name,Player_Name_Label

;Drawing Score of palyer
Print_Score Score_Label
;printing Player_Score_Level_1
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 72 ;Column Number
    INT 10H

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov count,0
mov ax,Player_Score_Level_1
Call Display_multi_digit_Num
mov count,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0

;Drawing Moves 
Print_Moves Moves_Label
;setting cursor position for printing Moves_left
    MOV AH,02H
    MOV BX,0
    MOV DH, 23 ;Row Number
    MOV DL, 15 ;Column Number
    INT 10H

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov count,0
mov ax,Moves_left
Call Display_multi_digit_Num
mov count,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0

Call Delay

mov X_start,0
mov Y_start,0

;Take starting coordinates
Take_Start_coordinates Infinite_loop, X_start, Y_start

Call Delay

mov X_end, 0
mov Y_end,0

;Take ending coordinates
Take_End_coordinates Infinite_loop, X_end, Y_end


;converting staring coordinates to array index
mov count,0
mov lines,0
mov temp,0
mov Index_Counter_Start,1

Calculate_Start_Coordinates_To_Index  X_start ,Y_start ,lines ,count ,temp, Index_Counter_Start

;converting ending coordinates to array index
mov count,0
mov lines,0
mov temp,0
mov Index_Counter_End,1

Calculate_End_Coordinates_To_Index  X_end ,Y_end ,lines ,count ,temp, Index_Counter_End

;====================================checking for valid move==============================================================

;calculate below difference
mov cl,Index_Counter_Start
add cl,7
mov Below_diff,cl

;calculate right difference
mov cl,Index_Counter_Start
add cl,1
mov Right_diff,cl

;calculate Upper difference
mov cl,Index_Counter_End
add cl,7
mov Up_diff,cl

;calculate left difference
mov cl,Index_Counter_End
add cl,1
mov Left_diff,cl


mov cl, Index_Counter_End
mov bl, Index_Counter_Start
.if Below_diff == cl
    jmp Valid_move
.elseif Right_diff == cl
    jmp Valid_move
.elseif Left_diff == bl
    jmp Valid_move
.elseif Up_diff == bl
    jmp Valid_move
.else 
    jmp Not_Valid_move
.endif
;====================================checking for valid move==============================================================


Valid_move:

;==================================================CHECK FOR BOMB========================================================
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    .if temp1 == 6
        jmp Bomb_explosion
    .elseif temp2 == 6
        jmp Bomb_explosion
    .else
        jmp Horizonat_Crushing
    .endif

    
    mov Bomb_candy,0
    Bomb_explosion:

    .if temp1 == 6
        mov bl,[di]
        mov Bomb_candy,bl
    .elseif temp2 == 6
        mov bl,[si]
        mov Bomb_candy,bl
    .endif
    mov bl,3
    mov [si],bl
    mov bl,1
    mov [di],bl
    mov count,0
    Bomb_Crushing Bomb_candy,Grid_Array,count,Rand_Array
    jmp Updating_Socre


;==================================================CHECK FOR BOMB========================================================

Horizonat_Crushing:
;=================================================Check for Horizontal Match==============================================

    ;if 2 candies are avaible together horizontally, and one candy is moving from left, making horizontal combo from left
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move
    .elseif temp2 ==0 
        jmp Not_Valid_move
    .endif

    inc di
    mov bl,[di]
    mov Next1,bl

    inc di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            dec di
            mov [di],bl
            jmp Swap
        .else
            jmp Left_Horizontal
        .endif
    .else
        jmp Left_Horizontal
    .endif

    Left_Horizontal:
    ;if 2 candies are avaible together horizontally, and one candy is moving from right, making horizontal combo from right
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move
    .elseif temp2 ==0 
        jmp Not_Valid_move
    .endif

    dec di
    mov bl,[di]
    mov Next1,bl

    dec di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            inc di
            mov [di],bl
            jmp Swap
        .else
            jmp Horizontal_by_vertical
        .endif
    .else
        jmp Horizontal_by_vertical
    .endif
    
    Horizontal_by_vertical:
    ;if 2 same candies are avaible together horizontally, with a gap in between and one candy is moving from top or bottom, making horizontal combo from vertical movement

    mov bh,Index_Counter_Start
    mov ch,Index_Counter_End

    .if Below_diff == ch
        jmp move_it
    .elseif Up_diff == bh
        jmp move_it
    .else   
        jmp Vertical_Combo
    .endif
    
    move_it:
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move
    .elseif temp2 ==0 
        jmp Not_Valid_move
    .endif

    dec di
    mov bl,[di]
    mov Next1,bl

    inc di

    inc di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            dec di
            dec di
            mov [di],bl
            jmp Swap
        .else
            jmp Vertical_Combo
        .endif
    .else
        jmp Vertical_Combo
    .endif


;=================================================Check for Horizontal Match==============================================


;=================================================Check for Vertical Match==============================================
Vertical_Combo:
    ;if there are 2 indentical candies below and a candy is moving from up to downwards.
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move
    .elseif temp2 ==0 
        jmp Not_Valid_move
    .endif

    .if Index_Counter_Start < 28
        jmp move_it1
    .elseif Index_Counter_Start < 35
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End
        .if Left_diff == bh
            jmp move_it1
        .elseif Right_diff == ch
            jmp move_it1
        .else
            jmp Vertical_Combo2
        .endif
        jmp Vertical_Combo2
    .endif

    move_it1:
        add di,7
        mov bl,[di]
        mov Next1,bl

        add di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                sub di,7
                mov [di],bl
                jmp Swap
            .else
                jmp Vertical_Combo2
            .endif
        .else
            jmp Vertical_Combo2
        .endif

    Vertical_Combo2:
    ;if there are 2 indentical candies upside and a candy is moving from down to upwards.

    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move
    .elseif temp2 ==0 
        jmp Not_Valid_move
    .endif

    .if Index_Counter_Start > 20
        jmp move_it2
    .elseif Index_Counter_Start > 13
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End
        .if Left_diff == bh
            jmp move_it2
        .elseif Right_diff == ch
            jmp move_it2
        .else
            jmp Vertical_Middle_Combo
        .endif
        jmp Vertical_Middle_Combo
    .endif

    move_it2:
        sub di,7
        mov bl,[di]
        mov Next1,bl

        sub di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                add di,7
                mov [di],bl
                jmp Swap
            .else
                jmp Vertical_Middle_Combo
            .endif
        .else
            jmp Vertical_Middle_Combo
        .endif
    
    ;if there is one candy up and 1 candy down and one candy is moving from either left or right to make a combo.
    Vertical_Middle_Combo:
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move
    .elseif temp2 ==0 
        jmp Not_Valid_move
    .endif

    .if Index_Counter_Start > 6
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End

        .if Left_diff == bh
            jmp move_it3
        .elseif Right_diff == ch
            jmp move_it3
        .else
            jmp Not_Valid_move
        .endif

    .elseif Index_Counter_Start < 42

        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End

        .if Left_diff == bh
            jmp move_it3
        .elseif Right_diff == ch
            jmp move_it3
        .else
            jmp Not_Valid_move
        .endif

    .else

        jmp Not_Valid_move

    .endif

    move_it3:
        sub di,7
        mov bl,[di]
        mov Next1,bl

        add di,7

        add di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                sub di,7
                sub di,7
                mov [di],bl
                jmp Swap
            .else
                jmp Not_Valid_move
            .endif
        .else
            jmp Not_Valid_move
        .endif
    

;=================================================Check for Vertical Match==============================================

Swap: 
Call Delay

;Swap values
mov temp1,0
mov temp2,0
Swap_Candies Index_Counter_Start,Index_Counter_End,temp1, temp2,Grid_Array,Candy_crushed

Updating_Socre:

;updating player score
Update_Score Candy_crushed,Player_Score_Level_1,Bomb_candy
mov Bomb_candy,0

.if Player_Score_Level_1 >= 20
    jmp Level1_end

.endif 

Call Delay

mov ah, 00h
mov bh,02
mov al, 14
int 10h

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

;draw boundary box
Draw_Opening_Box x,y,count,lines


;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
;Drawing Grid
Draw_Grid x , y , lines, count

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
    mov no_of_candies_horizontal,0
    mov no_of_candies_vertical,0

;Populating the Grid with candies
Draw_Candies_On_Grid count,lines,x,y,Grid_Array,no_of_candies_vertical,no_of_candies_horizontal,Candy_colour

;print if move is valid
Print_Valid_Move Valid_Move_Label
;dec moves remaining
dec Moves_left

.if Moves_left == 0
    .if Player_Score_Level_1 <= 20
        jmp Ask_Play_again_level1
    .else 
        jmp Level1_end
    .endif
    jmp Level1_end
.endif

jmp move_on


Not_Valid_move:
;print if move is not valid
Print_Not_Valid_Move Not_Valid_Move_Label
;dec moves remaining
dec Moves_left

.if Moves_left == 0
    .if Player_Score_Level_1 <= 20
        jmp Ask_Play_again_level1
    .else 
        jmp Level1_end
    .endif
    jmp Level1_end
.endif

move_on:

.endw

Ask_Play_again_level1:

;Check if player wants to play again

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
Draw_Play_Again_shape x,y,count,lines
Print_Play_Again Play_again_str1,Play_again_str2

    mov ah,01h
    int 21h

    ;checking if enter is pressed
    .if al == 13
        jmp Grid;start of game
    .elseif al == 27
        jmp Game_end;exit game
    .endif

;====================================================level 1 of game end here=======================================================

;====================================================level 2 of game start here=======================================================
Level1_end:

    MOV AH,02H
    MOV BX,0
    MOV DH, 10 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Level_completed
    mov ah,09h
    int 21h

    ;printing Play_again_str2
    MOV AH,02H
    MOV BX,0
    MOV DH, 12 ;Row Number
    MOV DL, 18 ;Column Number
    INT 10H

    mov dx, offset Continue_Message
    mov ah,09h
    int 21h

    .while Infinite_loop>0

    mov ah,01h
    int 21h

    ;checking if enter is pressed
    .if al == 13
        jmp Move_To_Level_2;start of game
    .endif

    .endw

Move_To_Level_2:
mov Player_Score_Level_2,0
mov Moves_left,5

mov ah, 00h
mov bh,03
mov al, 14
int 10h

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

;draw boundary box
Draw_Opening_Box x,y,count,lines


;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
;Drawing Grid
Draw_Grid x , y , lines, count

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
    mov no_of_candies_horizontal,0
    mov no_of_candies_vertical,0

;Populating the Grid with candies
Draw_Candies_On_Grid count,lines,x,y,Grid_Array_level_2,no_of_candies_vertical,no_of_candies_horizontal,Candy_colour


.while Infinite_loop > 0

;Drawing Level No
Print_Level_2 Level_2

;Drawing Name
Print_NAME Player_Name,Player_Name_Label

;Drawing Score of palyer
Print_Score Score_Label
;printing Player_Score_Level_1
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 72 ;Column Number
    INT 10H

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov count,0
mov ax,Player_Score_Level_2
Call Display_multi_digit_Num
mov count,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0

;Drawing Moves 
Print_Moves Moves_Label
;setting cursor position for printing Moves_left
    MOV AH,02H
    MOV BX,0
    MOV DH, 23 ;Row Number
    MOV DL, 15 ;Column Number
    INT 10H

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov count,0
mov ax,Moves_left
Call Display_multi_digit_Num
mov count,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0

Call Delay

mov X_start,0
mov Y_start,0

;Take starting coordinates
Take_Start_coordinates Infinite_loop, X_start, Y_start

Call Delay

mov X_end, 0
mov Y_end,0

;Take ending coordinates
Take_End_coordinates Infinite_loop, X_end, Y_end


;converting staring coordinates to array index
mov count,0
mov lines,0
mov temp,0
mov Index_Counter_Start,1

Calculate_Start_Coordinates_To_Index_level2  X_start ,Y_start ,lines ,count ,temp, Index_Counter_Start

;converting ending coordinates to array index
mov count,0
mov lines,0
mov temp,0
mov Index_Counter_End,1

Calculate_End_Coordinates_To_Index_level2  X_end ,Y_end ,lines ,count ,temp, Index_Counter_End

;====================================checking for valid move==============================================================

;calculate below difference
mov cl,Index_Counter_Start
add cl,7
mov Below_diff,cl

;calculate right difference
mov cl,Index_Counter_Start
add cl,1
mov Right_diff,cl

;calculate Upper difference
mov cl,Index_Counter_End
add cl,7
mov Up_diff,cl

;calculate left difference
mov cl,Index_Counter_End
add cl,1
mov Left_diff,cl


mov cl, Index_Counter_End
mov bl, Index_Counter_Start
.if Below_diff == cl
    jmp Valid_move_level2
.elseif Right_diff == cl
    jmp Valid_move_level2
.elseif Left_diff == bl
    jmp Valid_move_level2
.elseif Up_diff == bl
    jmp Valid_move_level2
.else 
    jmp Not_Valid_move_level2
.endif
;====================================checking for valid move==============================================================

Valid_move_level2:

;==================================================CHECK FOR BOMB========================================================
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_2,temp1,temp2

    .if temp1 == 6
        jmp Bomb_explosion_level2
    .elseif temp2 == 6
        jmp Bomb_explosion_level2
    .else
        jmp Horizonat_Crushing_level2
    .endif

    
    mov Bomb_candy,0
    Bomb_explosion_level2:

    .if temp1 == 6
        mov bl,[di]
        mov Bomb_candy,bl
    .elseif temp2 == 6
        mov bl,[si]
        mov Bomb_candy,bl
    .endif
    mov bl,3
    mov [si],bl
    mov bl,1
    mov [di],bl
    mov count,0
    Bomb_Crushing Bomb_candy,Grid_Array_level_2,count,Rand_Array
    jmp Updating_Socre_level2

;==================================================CHECK FOR BOMB========================================================
    

Horizonat_Crushing_level2:
;=================================================Check for Horizontal Match==============================================

    ;if 2 candies are avaible together horizontally, and one candy is moving from left, making horizontal combo from left
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_2,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level2
    .elseif temp2 ==0 
        jmp Not_Valid_move_level2
    .endif

    inc di
    mov bl,[di]
    mov Next1,bl

    inc di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            dec di
            mov [di],bl
            jmp Swap_level2
        .else
            jmp Left_Horizontal_level2
        .endif
    .else
        jmp Left_Horizontal_level2
    .endif

    Left_Horizontal_level2:
    ;if 2 candies are avaible together horizontally, and one candy is moving from right, making horizontal combo from right
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_2,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level2
    .elseif temp2 ==0 
        jmp Not_Valid_move_level2
    .endif

    dec di
    mov bl,[di]
    mov Next1,bl

    dec di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            inc di
            mov [di],bl
            jmp Swap_level2
        .else
            jmp Horizontal_by_vertical_level2
        .endif
    .else
        jmp Horizontal_by_vertical_level2
    .endif
    
    Horizontal_by_vertical_level2:
    ;if 2 same candies are avaible together horizontally, with a gap in between and one candy is moving from top or bottom, making horizontal combo from vertical movement

    mov bh,Index_Counter_Start
    mov ch,Index_Counter_End

    .if Below_diff == ch
        jmp move_it4
    .elseif Up_diff == bh
        jmp move_it4
    .else   
        jmp Vertical_Combo_level2
    .endif
    
    move_it4:
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_2,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level2
    .elseif temp2 ==0 
        jmp Not_Valid_move_level2
    .endif

    dec di
    mov bl,[di]
    mov Next1,bl

    inc di

    inc di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            dec di
            dec di
            mov [di],bl
            jmp Swap_level2
        .else
            jmp Vertical_Combo_level2
        .endif
    .else
        jmp Vertical_Combo_level2
    .endif


;=================================================Check for Horizontal Match==============================================

;=================================================Check for Vertical Match==============================================
Vertical_Combo_level2:
    ;if there are 2 indentical candies below and a candy is moving from up to downwards.
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_2,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level2
    .elseif temp2 ==0 
        jmp Not_Valid_move_level2
    .endif

    .if Index_Counter_Start < 28
        jmp move_it5
    .elseif Index_Counter_Start < 35
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End
        .if Left_diff == bh
            jmp move_it5
        .elseif Right_diff == ch
            jmp move_it5
        .else
            jmp Vertical_Combo2_level2
        .endif
        jmp Vertical_Combo2_level2
    .endif

    move_it5:
        add di,7
        mov bl,[di]
        mov Next1,bl

        add di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                sub di,7
                mov [di],bl
                jmp Swap_level2
            .else
                jmp Vertical_Combo2_level2
            .endif
        .else
            jmp Vertical_Combo2_level2
        .endif

    Vertical_Combo2_level2:
    ;if there are 2 indentical candies upside and a candy is moving from down to upwards.

    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_2,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level2
    .elseif temp2 ==0 
        jmp Not_Valid_move_level2
    .endif

    .if Index_Counter_Start > 20
        jmp move_it6
    .elseif Index_Counter_Start > 13
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End
        .if Left_diff == bh
            jmp move_it6
        .elseif Right_diff == ch
            jmp move_it6
        .else
            jmp Vertical_Middle_Combo_level2
        .endif
        jmp Vertical_Middle_Combo_level2
    .endif

    move_it6:
        sub di,7
        mov bl,[di]
        mov Next1,bl

        sub di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                add di,7
                mov [di],bl
                jmp Swap_level2
            .else
                jmp Vertical_Middle_Combo_level2
            .endif
        .else
            jmp Vertical_Middle_Combo_level2
        .endif
    
    ;if there is one candy up and 1 candy down and one candy is moving from either left or right to make a combo.
    Vertical_Middle_Combo_level2:
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_2,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level2
    .elseif temp2 ==0 
        jmp Not_Valid_move_level2
    .endif

    .if Index_Counter_Start > 6
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End

        .if Left_diff == bh
            jmp move_it7
        .elseif Right_diff == ch
            jmp move_it7
        .else
            jmp Not_Valid_move_level2
        .endif

    .elseif Index_Counter_Start < 42

        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End

        .if Left_diff == bh
            jmp move_it7
        .elseif Right_diff == ch
            jmp move_it7
        .else
            jmp Not_Valid_move_level2
        .endif

    .else

        jmp Not_Valid_move_level2

    .endif

    move_it7:
        sub di,7
        mov bl,[di]
        mov Next1,bl

        add di,7

        add di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                sub di,7
                sub di,7
                mov [di],bl
                jmp Swap_level2
            .else
                jmp Not_Valid_move_level2
            .endif
        .else
            jmp Not_Valid_move_level2
        .endif
    

;=================================================Check for Vertical Match==============================================

Swap_level2: 
Call Delay

;Swap values
mov temp1,0
mov temp2,0
Swap_Candies Index_Counter_Start,Index_Counter_End,temp1, temp2,Grid_Array_level_2,Candy_crushed

Updating_Socre_level2:

;updating player score
Update_Score Candy_crushed,Player_Score_Level_2,Bomb_candy
mov Bomb_candy,0

.if Player_Score_Level_2 >= 20
    jmp Level2_end

.endif 

Call Delay

mov ah, 00h
mov bh,03
mov al, 14
int 10h

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

;draw boundary box
Draw_Opening_Box x,y,count,lines


;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
;Drawing Grid
Draw_Grid x , y , lines, count

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
    mov no_of_candies_horizontal,0
    mov no_of_candies_vertical,0

;Populating the Grid with candies
Draw_Candies_On_Grid count,lines,x,y,Grid_Array_level_2,no_of_candies_vertical,no_of_candies_horizontal,Candy_colour

;print if move is valid
Print_Valid_Move Valid_Move_Label
;dec moves remaining
dec Moves_left

.if Moves_left == 0
    .if Player_Score_Level_2 <= 20
        jmp Ask_Play_again_level2
    .else 
        jmp Level2_end
    .endif
    jmp Level2_end
.endif

jmp move_on_level2


Not_Valid_move_level2:
;print if move is not valid
Print_Not_Valid_Move Not_Valid_Move_Label
;dec moves remaining
dec Moves_left

.if Moves_left == 0
    .if Player_Score_Level_2 <= 20
        jmp Ask_Play_again_level2
    .else 
        jmp Level2_end
    .endif
    jmp Level2_end
.endif

move_on_level2:

.endw

Ask_Play_again_level2:

;Check if player wants to play again

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
Draw_Play_Again_shape x,y,count,lines
Print_Play_Again Play_again_str1,Play_again_str2

    mov ah,01h
    int 21h

    ;checking if enter is pressed
    .if al == 13
        jmp Move_To_Level_2;start of game
    .elseif al == 27
        jmp Game_end;exit game
    .endif



;====================================================level 2 of game start here=======================================================

Level2_end:

    MOV AH,02H
    MOV BX,0
    MOV DH, 10 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Level_completed
    mov ah,09h
    int 21h

    ;printing Play_again_str2
    MOV AH,02H
    MOV BX,0
    MOV DH, 12 ;Row Number
    MOV DL, 18 ;Column Number
    INT 10H

    mov dx, offset Continue_Message
    mov ah,09h
    int 21h

    .while Infinite_loop>0

    mov ah,01h
    int 21h

    ;checking if enter is pressed
    .if al == 13
        jmp Move_To_Level_3;start of game
    .endif

    .endw

Move_To_Level_3:

mov Player_Score_Level_3,0
mov Moves_left,5

mov ah, 00h
mov bh,04
mov al, 14
int 10h

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

;draw boundary box
Draw_Opening_Box x,y,count,lines


;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
;Drawing Grid
Draw_Grid x , y , lines, count

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
    mov no_of_candies_horizontal,0
    mov no_of_candies_vertical,0

;Populating the Grid with candies
Draw_Candies_On_Grid count,lines,x,y,Grid_Array_level_3,no_of_candies_vertical,no_of_candies_horizontal,Candy_colour


.while Infinite_loop > 0

;Drawing Level No
Print_Level_3 Level_3

;Drawing Name
Print_NAME Player_Name,Player_Name_Label

;Drawing Score of palyer
Print_Score Score_Label
;printing Player_Score_Level_1
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 72 ;Column Number
    INT 10H

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov count,0
mov ax,Player_Score_Level_3
Call Display_multi_digit_Num
mov count,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0

;Drawing Moves 
Print_Moves Moves_Label
;setting cursor position for printing Moves_left
    MOV AH,02H
    MOV BX,0
    MOV DH, 23 ;Row Number
    MOV DL, 15 ;Column Number
    INT 10H

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov count,0
mov ax,Moves_left
Call Display_multi_digit_Num
mov count,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0

Call Delay

mov X_start,0
mov Y_start,0

;Take starting coordinates
Take_Start_coordinates Infinite_loop, X_start, Y_start

Call Delay

mov X_end, 0
mov Y_end,0

;Take ending coordinates
Take_End_coordinates Infinite_loop, X_end, Y_end


;converting staring coordinates to array index
mov count,0
mov lines,0
mov temp,0
mov Index_Counter_Start,1

Calculate_Start_Coordinates_To_Index_level3  X_start ,Y_start ,lines ,count ,temp, Index_Counter_Start

;converting ending coordinates to array index
mov count,0
mov lines,0
mov temp,0
mov Index_Counter_End,1

Calculate_End_Coordinates_To_Index_level3  X_end ,Y_end ,lines ,count ,temp, Index_Counter_End

;====================================checking for valid move==============================================================

;calculate below difference
mov cl,Index_Counter_Start
add cl,7
mov Below_diff,cl

;calculate right difference
mov cl,Index_Counter_Start
add cl,1
mov Right_diff,cl

;calculate Upper difference
mov cl,Index_Counter_End
add cl,7
mov Up_diff,cl

;calculate left difference
mov cl,Index_Counter_End
add cl,1
mov Left_diff,cl


mov cl, Index_Counter_End
mov bl, Index_Counter_Start
.if Below_diff == cl
    jmp Valid_move_level3
.elseif Right_diff == cl
    jmp Valid_move_level3
.elseif Left_diff == bl
    jmp Valid_move_level3
.elseif Up_diff == bl
    jmp Valid_move_level3
.else 
    jmp Not_Valid_move_level3
.endif
;====================================checking for valid move==============================================================

Valid_move_level3:

;==================================================CHECK FOR BOMB========================================================
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_3,temp1,temp2

    .if temp1 == 6
        jmp Bomb_explosion_level3
    .elseif temp2 == 6
        jmp Bomb_explosion_level3
    .else
        jmp Horizonat_Crushing_level3
    .endif

    
    mov Bomb_candy,0
    Bomb_explosion_level3:

    .if temp1 == 6
        mov bl,[di]
        mov Bomb_candy,bl
    .elseif temp2 == 6
        mov bl,[si]
        mov Bomb_candy,bl
    .endif
    mov bl,3
    mov [si],bl
    mov bl,1
    mov [di],bl
    mov count,0
    Bomb_Crushing Bomb_candy,Grid_Array_level_3,count,Rand_Array
    jmp Updating_Socre_level3

;==================================================CHECK FOR BOMB========================================================
    

Horizonat_Crushing_level3:
;=================================================Check for Horizontal Match==============================================

    ;if 2 candies are avaible together horizontally, and one candy is moving from left, making horizontal combo from left
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_3,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level3
    .elseif temp2 ==0 
        jmp Not_Valid_move_level3
    .endif

    inc di
    mov bl,[di]
    mov Next1,bl

    inc di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            dec di
            mov [di],bl
            jmp Swap_level3
        .else
            jmp Left_Horizontal_level3
        .endif
    .else
        jmp Left_Horizontal_level3
    .endif

    Left_Horizontal_level3:
    ;if 2 candies are avaible together horizontally, and one candy is moving from right, making horizontal combo from right
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_3,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level3
    .elseif temp2 ==0 
        jmp Not_Valid_move_level3
    .endif

    dec di
    mov bl,[di]
    mov Next1,bl

    dec di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            inc di
            mov [di],bl
            jmp Swap_level2
        .else
            jmp Horizontal_by_vertical_level3
        .endif
    .else
        jmp Horizontal_by_vertical_level3
    .endif
    
    Horizontal_by_vertical_level3:
    ;if 2 same candies are avaible together horizontally, with a gap in between and one candy is moving from top or bottom, making horizontal combo from vertical movement

    mov bh,Index_Counter_Start
    mov ch,Index_Counter_End

    .if Below_diff == ch
        jmp move_it8
    .elseif Up_diff == bh
        jmp move_it8
    .else   
        jmp Vertical_Combo_level3
    .endif
    
    move_it8:
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_3,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level3
    .elseif temp2 ==0 
        jmp Not_Valid_move_level3
    .endif

    dec di
    mov bl,[di]
    mov Next1,bl

    inc di

    inc di
    mov bl,[di]
    mov Next2,bl

    mov bl,Next1
    mov cl,Next2

    .if temp1 == bl
        .if temp1 == cl
            Crush_Candies Next1, Next2
            mov bl,Next1
            mov cl,Next2
            mov [di],cl
            dec di
            dec di
            mov [di],bl
            jmp Swap_level3
        .else
            jmp Vertical_Combo_level3
        .endif
    .else
        jmp Vertical_Combo_level3
    .endif


;=================================================Check for Horizontal Match==============================================

;=================================================Check for Vertical Match==============================================
Vertical_Combo_level3:
    ;if there are 2 indentical candies below and a candy is moving from up to downwards.
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_3,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level3
    .elseif temp2 ==0 
        jmp Not_Valid_move_level3
    .endif

    .if Index_Counter_Start < 28
        jmp move_it9
    .elseif Index_Counter_Start < 35
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End
        .if Left_diff == bh
            jmp move_it9
        .elseif Right_diff == ch
            jmp move_it9
        .else
            jmp Vertical_Combo2_level3
        .endif
        jmp Vertical_Combo2_level3
    .endif

    move_it9:
        add di,7
        mov bl,[di]
        mov Next1,bl

        add di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                sub di,7
                mov [di],bl
                jmp Swap_level3
            .else
                jmp Vertical_Combo2_level3
            .endif
        .else
            jmp Vertical_Combo2_level3
        .endif

    Vertical_Combo2_level3:
    ;if there are 2 indentical candies upside and a candy is moving from down to upwards.

    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_3,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level3
    .elseif temp2 ==0 
        jmp Not_Valid_move_level3
    .endif

    .if Index_Counter_Start > 20
        jmp move_it11
    .elseif Index_Counter_Start > 13
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End
        .if Left_diff == bh
            jmp move_it11
        .elseif Right_diff == ch
            jmp move_it11
        .else
            jmp Vertical_Middle_Combo_level3
        .endif
        jmp Vertical_Middle_Combo_level3
    .endif

    move_it11:
        sub di,7
        mov bl,[di]
        mov Next1,bl

        sub di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                add di,7
                mov [di],bl
                jmp Swap_level2
            .else
                jmp Vertical_Middle_Combo_level3
            .endif
        .else
            jmp Vertical_Middle_Combo_level3
        .endif
    
    ;if there is one candy up and 1 candy down and one candy is moving from either left or right to make a combo.
    Vertical_Middle_Combo_level3:
    mov Strat_Index,0
    mov End_Index,0
    mov temp1,0
    mov temp2,0
    mov Next1,0
    mov Next2,0
    Check_Move Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array_level_3,temp1,temp2

    .if temp1 == 0
        jmp Not_Valid_move_level3
    .elseif temp2 ==0 
        jmp Not_Valid_move_level3
    .endif

    .if Index_Counter_Start > 6
        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End

        .if Left_diff == bh
            jmp move_it12
        .elseif Right_diff == ch
            jmp move_it12
        .else
            jmp Not_Valid_move_level3
        .endif

    .elseif Index_Counter_Start < 42

        mov bh,Index_Counter_Start
        mov ch,Index_Counter_End

        .if Left_diff == bh
            jmp move_it12
        .elseif Right_diff == ch
            jmp move_it12
        .else
            jmp Not_Valid_move_level3
        .endif

    .else

        jmp Not_Valid_move_level3

    .endif

    move_it12:
        sub di,7
        mov bl,[di]
        mov Next1,bl

        add di,7

        add di,7
        mov bl,[di]
        mov Next2,bl

        mov bl,Next1
        mov cl,Next2

        .if temp1 == bl
            .if temp1 == cl
                Crush_Candies Next1, Next2
                mov bl,Next1
                mov cl,Next2
                mov [di],cl
                sub di,7
                sub di,7
                mov [di],bl
                jmp Swap_level2
            .else
                jmp Not_Valid_move_level3
            .endif
        .else
            jmp Not_Valid_move_level3
        .endif
    

;=================================================Check for Vertical Match==============================================

Swap_level3: 
Call Delay

;Swap values
mov temp1,0
mov temp2,0
Swap_Candies Index_Counter_Start,Index_Counter_End,temp1, temp2,Grid_Array_level_3,Candy_crushed

Updating_Socre_level3:

;updating player score
Update_Score Candy_crushed,Player_Score_Level_3,Bomb_candy
mov Bomb_candy,0

.if Player_Score_Level_3 > 20
    jmp Final_Screen

.endif 

Call Delay

mov ah, 00h
mov bh,04
mov al, 14
int 10h

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

;draw boundary box
Draw_Opening_Box x,y,count,lines


;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
;Drawing Grid
Draw_Grid x , y , lines, count

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
    mov no_of_candies_horizontal,0
    mov no_of_candies_vertical,0

;Populating the Grid with candies
Draw_Candies_On_Grid count,lines,x,y,Grid_Array_level_3,no_of_candies_vertical,no_of_candies_horizontal,Candy_colour

;print if move is valid
Print_Valid_Move Valid_Move_Label
;dec moves remaining
dec Moves_left

.if Moves_left == 0
    .if Player_Score_Level_3 < 20
        jmp Ask_Play_again_level3
    .else 
        jmp Final_Screen
    .endif
    jmp Final_Screen
.endif

jmp move_on_level3


Not_Valid_move_level3:
;print if move is not valid
Print_Not_Valid_Move Not_Valid_Move_Label
;dec moves remaining
dec Moves_left

.if Moves_left == 0
    .if Player_Score_Level_3 < 20
        jmp Ask_Play_again_level3
    .else 
        jmp Final_Screen
    .endif
    jmp Final_Screen
.endif

move_on_level3:

.endw

Ask_Play_again_level3:

;Check if player wants to play again

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0
Draw_Play_Again_shape x,y,count,lines
Print_Play_Again Play_again_str1,Play_again_str2

    mov ah,01h
    int 21h

    ;checking if enter is pressed
    .if al == 13
        jmp Move_To_Level_3;start of game
    .elseif al == 27
        jmp Game_end;exit game
    .endif

Game_end:

Final_Screen:

mov ah, 00h
mov bh,05
mov al, 14
int 10h

mov ax,Player_Score_Level_1
mov bx,Playe_Toatl_Score
add bx,ax
mov ax,Player_Score_Level_2
add bx,ax
mov ax,Player_Score_Level_3
add bx,ax
mov Playe_Toatl_Score,bx

;intialize variable
    mov count,0
    mov lines,0
    mov x,0
    mov y,0

;draw boundary box
Draw_Opening_Box x,y,count,lines

;Player name
    MOV AH,02H
    MOV BX,0
    MOV DH, 6 ;Row Number
    MOV DL, 30 ;Column Number
    INT 10H

    mov dx, offset Player_Name_Label
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 6 ;Row Number
    MOV DL, 35 ;Column Number
    INT 10H

    mov dx, offset Player_Name
    mov ah,09h
    int 21h

;Level 1 score
    MOV AH,02H
    MOV BX,0
    MOV DH, 10 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Level_1_Score
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 10 ;Row Number
    MOV DL, 40 ;Column Number
    INT 10H

    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    mov count,0
    mov ax,Player_Score_Level_1
    Call Display_multi_digit_Num
    mov count,0
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0


; Level 2 score
    MOV AH,02H
    MOV BX,0
    MOV DH, 14 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Level_2_Score
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 14 ;Row Number
    MOV DL, 40 ;Column Number
    INT 10H

    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    mov count,0
    mov ax,Player_Score_Level_2
    Call Display_multi_digit_Num
    mov count,0
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0

; level 3 score
    MOV AH,02H
    MOV BX,0
    MOV DH, 18 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Level_3_Score
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 18 ;Row Number
    MOV DL, 40 ;Column Number
    INT 10H

    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    mov count,0
    mov ax,Player_Score_Level_3
    Call Display_multi_digit_Num
    mov count,0
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0


;total score
    MOV AH,02H
    MOV BX,0
    MOV DH, 20 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Total_Score_end
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 20 ;Row Number
    MOV DL, 40 ;Column Number
    INT 10H

    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    mov count,0
    mov ax,Playe_Toatl_Score
    Call Display_multi_digit_Num
    mov count,0
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
;storing level1 score
mov ax,Player_Score_Level_1
mov bl,10
div bl

mov L1p1,al
mov L1p2,ah

mov si,offset Lvl1

mov cl,L1p1
add cl,48
mov [si],cl
inc si
mov cl,L1p2
add cl,48
mov [si],cl

;storing level2 score
mov ax,Player_Score_Level_2
mov bl,10
div bl

mov L2p1,al
mov L2p2,ah

mov si,offset Lvl2

mov cl,L2p1
add cl,48
mov [si],cl
inc si
mov cl,L2p2
add cl,48
mov [si],cl

;storing level3 score
mov ax,Player_Score_Level_3
mov bl,10
div bl

mov L3p1,al
mov L3p2,ah

mov si,offset Lvl3

mov cl,L3p1
add cl,48
mov [si],cl
inc si
mov cl,L3p2
add cl,48
mov [si],cl

;storing total score
mov ax,Playe_Toatl_Score
mov bl,10
div bl

mov t1p1,al
mov t1p2,ah

mov si,offset Ttl

mov cl,t1p1
add cl,48
mov [si],cl
inc si
mov cl,t1p2
add cl,48
mov [si],cl


mov dx,offset file
mov al,1
mov ah,3dh
int 21h

mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h

mov cx,lengthof Player_Name_Label; should have been 1 less than length of msg.
dec cx
mov dx,offset Player_Name_Label
mov ah,40h
int 21h

mov cx,lengthof Player_Name; should have been 1 less than length of msg.
dec cx
mov dx,offset Player_Name
mov ah,40h
int 21h

mov cx,lengthof Level_1_Score; should have been 1 less than length of msg.
dec cx
mov dx,offset Level_1_Score
mov ah,40h
int 21h

mov cx,lengthof Lvl1; should have been 1 less than length of msg.
dec cx
mov dx,offset Lvl1
mov ah,40h
int 21h

mov cx,lengthof Level_2_Score; should have been 1 less than length of msg.
dec cx
mov dx,offset Level_2_Score
mov ah,40h
int 21h

mov cx,lengthof Lvl2; should have been 1 less than length of msg.
dec cx
mov dx,offset Lvl2
mov ah,40h
int 21h

mov cx,lengthof Level_3_Score; should have been 1 less than length of msg.
dec cx
mov dx,offset Level_3_Score
mov ah,40h
int 21h

mov cx,lengthof Lvl3; should have been 1 less than length of msg.
dec cx
mov dx,offset Lvl3
mov ah,40h
int 21h

mov cx,lengthof Total_Score_end; should have been 1 less than length of msg.
dec cx
mov dx,offset Total_Score_end
mov ah,40h
int 21h

mov cx,lengthof Ttl; should have been 1 less than length of msg.
dec cx
mov dx,offset Ttl
mov ah,40h
int 21h

mov ah,3eh
int 21h

mov ah,4ch
int 21h

main endp

Delay proc 

    push cx
    push dx 
    mov cx,500

    loop1:

        mov dx, 500

        loop2:
            dec dx
            cmp dx,0
            jne loop2

    loop loop1

    pop dx
    pop cx

    ret

Delay endp

Display_multi_digit_Num proc

    Output:

        mov bl,10

        L1:
        cmp al,0
        je disp

        div bl
        mov cl,ah
        mov ch,0
        push cx
        mov ah,0
        inc count
        jmp L1

    disp:
        cmp count,0
        je exit
        pop dx
        add dx,48
        mov ah, 02h
        int 21h
        dec count
        jmp disp

    exit:

        ret

Display_multi_digit_Num endp

end main