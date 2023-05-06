;Macro for printing horizontal lines
Draw_Horizontal_Line MACRO x , y , lines, count

    ;outer loop for printing 8 horizontal lines
    .while lines < 8

        ;inner loop for printing 1 single horizontal line
        .while count <=490
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 0fh
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw

        ;resetting cordinates to print the next line, e.g reset value of count, and strating position of x and incrementing y to create gap inbetween
        mov bx,y
        add bx,20
        mov y,bx

        mov bx,75
        mov x,bx

        mov bx,0
        mov count,bx

        inc lines
    
    .endw

ENDM

;Macro for printing vertical lines
Draw_Vertical_Line MACRO x , y , lines, count

    ;outer loop for printing 8 vertical lines
    .while lines < 8

        ;inner loop for printing 1 single vertical line
        .while count <=140

            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 0fh
            mov ah, 0ch
            int 10h
            inc y

            inc count

        .endw
        ;resetting cordinates to print the next line, e.g reset value of count, and strating position of y and incrementing x to create gap inbetween
        mov bx,x
        add bx,70
        mov x,bx

        mov bx,30
        mov y,bx

        mov bx,0
        mov count,bx

        inc lines

    .endw

ENDM

Draw_sql Macro x,y,count

mov ah, 00h
mov al, 6
int 10h


mov bx,270
mov x,bx

mov bx,90
mov y,bx

.while count <=20

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw

mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,100
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,100
mov y,bx

.while count <=20

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw


mov bl,0
mov count,bl

mov bx,290
mov x,bx

mov bx,100
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec y

    inc count

.endw


ENDM

Draw_circ Macro x,y,count
mov ah, 00h
mov al, 6
int 10h


mov bx,275
mov x,bx

mov bx,90
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw


mov bl,0
mov count,bl

mov bx,271
mov x,bx

mov bx,93
mov y,bx

.while count <=3

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    dec y

    inc count

.endw




mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,97
mov y,bx

.while count <=3

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,274
mov x,bx

mov bx,100
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw


mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,97
mov y,bx

.while count <=3

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    inc y

    inc count

.endw


mov bl,0
mov count,bl

mov bx,289
mov x,bx

mov bx,96
mov y,bx

.while count <=3

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,285
mov x,bx

mov bx,100
mov y,bx

.while count <=3

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    dec y

    inc count

.endw


mov bl,0
mov count,bl

mov bx,285
mov x,bx

mov bx,90
mov y,bx

.while count <=3

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    inc y

    inc count

.endw
ENDM

Draw_Diff_shapes Macro x,y,count

mov ah, 00h
mov al, 6
int 10h


mov bx,280
mov x,bx

mov bx,90
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,100
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    dec y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,100
mov y,bx

.while count <=20

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw

mov ah, 00h
mov al, 6
int 10h


mov bx,270
mov x,bx

mov bx,90
mov y,bx

.while count <=40

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw

mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,100
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,270
mov x,bx

mov bx,100
mov y,bx

.while count <=40

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw


mov bl,0
mov count,bl

mov bx,310
mov x,bx

mov bx,100
mov y,bx

.while count <=10

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec y

    inc count

.endw

mov ah, 00h
mov al, 6
int 10h


mov bx,280
mov x,bx

mov bx,50
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    inc x
    inc x
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,280
mov x,bx

mov bx,50
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec x
    dec x
    dec x
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,190
mov x,bx

mov bx,80
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,370
mov x,bx

mov bx,80
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec x
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,220
mov x,bx

mov bx,110
mov y,bx

.while count <=120

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw


mov ah, 00h
mov al, 6
int 10h


mov bx,280
mov x,bx

mov bx,90
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,280
mov x,bx

mov bx,90
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    dec y

    inc count

.endw



mov bl,0
mov count,bl

mov bx,420
mov x,bx

mov bx,90
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec x
    dec y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,390
mov x,bx

mov bx,120
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    dec y

    inc count

.endw


mov bl,0
mov count,bl

mov bx,310
mov x,bx

mov bx,60
mov y,bx

.while count <=80

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw


mov bl,0
mov count,bl

mov bx,310
mov x,bx

mov bx,120
mov y,bx

.while count <=80

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw

mov ah, 00h
mov al, 6
int 10h


mov bx,280
mov x,bx

mov bx,120
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,280
mov x,bx

mov bx,90
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    dec y

    inc count

.endw



mov bl,0
mov count,bl

mov bx,420
mov x,bx

mov bx,90
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    dec x
    dec y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,390
mov x,bx

mov bx,150
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x
    dec y

    inc count

.endw


mov bl,0
mov count,bl

mov bx,310
mov x,bx

mov bx,60
mov y,bx

.while count <=80

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw


mov bl,0
mov count,bl

mov bx,310
mov x,bx

mov bx,150
mov y,bx

.while count <=80

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc x

    inc count

.endw

mov bl,0
mov count,bl

mov bx,420
mov x,bx

mov bx,90
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc y

    inc count

.endw

mov bl,0
mov count,bl

mov bx,280
mov x,bx

mov bx,90
mov y,bx

.while count <=30

    mov bh,0
    mov cx, x
    mov dx, y
    mov al, 0fh
    mov ah, 0ch
    int 10h
    inc y

    inc count

.endw


ENDM

Draw_Grid MACRO x , y , lines, count

;====================================== START CREATING GRID =============================================

;--------- Start Code to print horizontal lines-------------

;intializing x,y values for printing horizontal lines
    mov bx,75
    mov x,bx

    mov bx,30
    mov y,bx

;Calling Macro for printing horizontal lines
    Draw_Horizontal_Line x, y,lines,count

;--------- End Code to print horizontal lines-------------


;--------- Start Code to print Vertical lines-------------

;intializing x,y values for printing Vertical lines
    mov bx,0
    mov count,bx

    mov bx,75
    mov x,bx

    mov bx,30
    mov y,bx

    mov lines,0

;Calling Macro for printing Vertical lines
    Draw_Vertical_Line x , y, lines, count

;--------- End Code to print Vertical lines-------------

ENDM
;====================================== END CREATING GRID =============================================


;====================================== Start Populating GRID =============================================

Draw_Candies_On_Grid MACRO count,lines,x,y,Grid_Array,no_of_candies_vertical,no_of_candies_horizontal,Candy_colour

mov si, offset Grid_Array

mov count,0
mov lines,0
mov x,75
mov y,30

.while no_of_candies_vertical < 7

    .while no_of_candies_horizontal < 7

        mov bl,[si]

        .if bl == 1

            Draw_Square x,y,count,lines

        .elseif bl == 2
            mov Candy_colour, 03h
            Draw_Triangle x,y,count,lines,Candy_colour

        .elseif bl == 3

            Draw_Diamond x,y,count,lines

        .elseif bl == 4

            Draw_Plus x,y,count,lines

        .elseif bl == 5
            mov Candy_colour, 04h
            Draw_Inverse_Triangle x,y,count,lines,Candy_colour

        .elseif bl == 6
            mov Candy_colour, 08h
            Draw_Inverse_Triangle x,y,count,lines,Candy_colour
            mov count,0
            mov lines,0
            mov Candy_colour, 08h
            Draw_Triangle x,y,count,lines,Candy_colour

        .elseif bl == 0

            Draw_Plain_Tile x,y,count,lines

        .endif

        mov count,0
        mov lines,0
        add x,70
        inc si
        inc no_of_candies_horizontal
    .endw

    mov no_of_candies_horizontal,0
    mov x,75
    add y,20
    inc no_of_candies_vertical

.endw


ENDM


;====================================== END Populating GRID =============================================


;================================================== START DRAWING SQUARE SHAPE =============================================

Draw_Square Macro x,y,count,lines


;add in x and y to make them centered in the box 
add x,25
add y,5

;printing the Top line of the Square 

.while lines <=10

    .while count <=20

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 02h
        mov ah, 0ch
        int 10h
        inc x

        inc count

    .endw

    mov count,0
    inc y
    sub x,21
    inc lines

.endw

sub x,25
sub y,16


ENDM

;================================================== END DRAWING SQUARE SHAPE =============================================

;================================================== START DRAWING SQUARE SHAPE =============================================

Draw_Plain_Tile Macro x,y,count,lines

;printing the Top line of the Square 

.while lines <=20

    .while count <=70

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 07h
        mov ah, 0ch
        int 10h
        inc x

        inc count

    .endw

    mov count,0
    inc y
    sub x,71
    inc lines

.endw
sub y,21
ENDM

;================================================== END DRAWING SQUARE SHAPE =============================================


;================================================== START DRAWING TRIANGLE SHAPE =============================================

Draw_Triangle Macro x,y,count,lines,Candy_colour


;add in x and y to make them centered in the box 
add x,35
add y,5

;printing the Left side of triangle

.while lines <=10

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, Candy_colour
        mov ah, 0ch
        int 10h
        inc x

        dec count

    .endw

    inc y
    sub x,bx
    inc lines

.endw

;re intializing the coordinates of the second triangle
sub x,30
sub y,17

mov lines,0
mov count,0

add x,30
add y,6

;printing the Right side of triangle
.while lines <=10

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, Candy_colour
        mov ah, 0ch
        int 10h
        dec x

        dec count

    .endw

    inc y
    add x,bx
    inc lines

.endw

sub x,35
sub y,16

ENDM

;================================================== END DRAWING TRIANGLE SHAPE =============================================


;================================================== START DRAWING INVERSE TRIANGLE SHAPE =============================================

Draw_Inverse_Triangle Macro x,y,count,lines,Candy_colour


;add in x and y to make them centered in the box 
add x,35
add y,15

;printing the Left side of triangle

.while lines <=10

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, Candy_colour
        mov ah, 0ch
        int 10h
        inc x

        dec count

    .endw

    dec y
    sub x,bx
    inc lines

.endw

;re intializing the coordinates of the second triangle
sub x,30
sub y,5

mov lines,0
mov count,0

add x,30
add y,16

;printing the Right side of triangle
.while lines <=10

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, Candy_colour
        mov ah, 0ch
        int 10h
        dec x

        dec count

    .endw

    dec y
    add x,bx
    inc lines

.endw

sub x,35
sub y,4

ENDM

;================================================== END DRAWING INVERSE TRIANGLE SHAPE =============================================

;================================================== START DRAWING PLUS SHAPE =============================================

Draw_Plus Macro x,y,count,lines


;add in x and y to make them centered in the box 
add x,30
add y,3

;printing the vertical line of the plus

.while lines <=14

    .while count <=8

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 05h
        mov ah, 0ch
        int 10h
        inc x

        inc count

    .endw

    mov count,0
    inc y
    sub x,9
    inc lines

.endw

;subtract from x and y to re intialize the coordinates 

sub x,30
sub y,18

mov lines,0
mov count,0

;add in x and y to make them centered in the box 

add x,20
add y,7

;printing the Horizontal line of the plus

.while lines <=5

    .while count <=28

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 05h
        mov ah, 0ch
        int 10h
        inc x

        inc count

    .endw

    mov count,0
    inc y
    sub x,29
    inc lines

.endw

sub x,20
sub y,13


ENDM

;================================================== END DRAWING PLUS SHAPE =============================================


;================================================== START DRAWING Diamond SHAPE =============================================

Draw_Diamond Macro x,y,count,lines


;add in x and y to make them centered in the box 
add x,35
add y,3

;printing the upper Left side of triangle

.while lines <=6

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 06h
        mov ah, 0ch
        int 10h
        inc x

        dec count

    .endw

    inc y
    sub x,bx
    inc lines

.endw

;re intializing the coordinates of the second triangle
sub x,30
sub y,15

mov lines,0
mov count,0

add x,30
add y,8

;printing the upper Right side of triangle
.while lines <=6

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 06h
        mov ah, 0ch
        int 10h
        dec x

        dec count

    .endw

    inc y
    add x,bx
    inc lines

.endw

sub x,30
sub y,8

mov lines,0
mov count,0

add x,30
add y,15

;printing the lower Left side of triangle

.while lines <=7

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 06h
        mov ah, 0ch
        int 10h
        inc x

        dec count

    .endw

    dec y
    sub x,bx
    inc lines

.endw

;re intializing the coordinates of the second triangle
sub x,30
sub y,5

mov lines,0
mov count,0

add x,30
add y,13

;printing the lower Right side of triangle
.while lines <=7

    mov bx,lines
    mov count,bx

    .while count > 0

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 06h
        mov ah, 0ch
        int 10h
        dec x

        dec count

    .endw

    dec y
    add x,bx
    inc lines

.endw

sub x,35
sub y,9

ENDM

;================================================== END DRAWING TRIANGLE SHAPE =============================================


;================================================== Start Drawing Opening Box ==============================================

Draw_Opening_Box Macro x,y,count,lines

;printing the upper lines of the box
    .while lines < 5
        .while count < 640
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 02h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,0
        inc lines
        inc y
    .endw

;printing the lower lines of the box
mov x,0
mov y,195
mov count,0
mov lines,0
    .while lines < 5
        .while count < 640
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 03h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,0
        inc lines
        inc y
    .endw

;printing the left lines of the box
mov x,0
mov y,0
mov count,0
mov lines,0

    .while lines < 10
        .while count < 200
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 04h
            mov ah, 0ch
            int 10h
            inc y
            inc count
        .endw
        mov count,0
        mov y,0
        inc lines
        inc x
    .endw

;printing the left lines of the box
mov x,630
mov y,0
mov count,0
mov lines,0

    .while lines < 10
        .while count < 200
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 05h
            mov ah, 0ch
            int 10h
            inc y
            inc count
        .endw
        mov count,0
        mov y,0
        inc lines
        inc x
    .endw


ENDM

;================================================== End Drawing Opening Box ==============================================

;================================================== Start Draw Candies on Opening Page ==============================================

Draw_candies_on_front_page MACRO x,y,count,lines

mov count,0
mov lines,0
mov x,145
mov y,50
Draw_Square x,y,count,lines
mov count,0
mov lines,0
mov x,215
mov y,50
mov Candy_colour,04h
Draw_Triangle x,y,count,lines,Candy_colour
mov count,0
mov lines,0
mov x,285
mov y,50
Draw_Diamond x,y,count,lines
mov count,0
mov lines,0
mov x,355
mov y,50
Draw_Plus x,y,count,lines
mov count,0
mov lines,0
mov x,425
mov y,50
mov Candy_colour,01h
Draw_Inverse_Triangle x,y,count,lines,Candy_colour

mov count,0
mov lines,0
mov x,0
mov y,0

ENDM

;================================================== End Draw Candies on Opening Page ==============================================

;================================================== Start Drawing Opening Box ==============================================

Draw_Game_Title_Box Macro x,y,count,lines


;printing the upper lines of the box
mov x,145
mov y,80
mov count,0
mov lines,0
    .while lines < 2
        .while count < 350
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 02h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,145
        inc lines
        inc y
    .endw

;printing the lower lines of the box
mov x,145
mov y,110
mov count,0
mov lines,0
    .while lines < 2
        .while count < 350
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 03h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,145
        inc lines
        inc y
    .endw

;printing the left lines of the box
mov x,145
mov y,80
mov count,0
mov lines,0

    .while lines < 2
        .while count < 30
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 04h
            mov ah, 0ch
            int 10h
            inc y
            inc count
        .endw
        mov count,0
        mov y,80
        inc lines
        inc x
    .endw

;printing the left lines of the box
mov x,495
mov y,80
mov count,0
mov lines,0

    .while lines < 2
        .while count < 30
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 05h
            mov ah, 0ch
            int 10h
            inc y
            inc count
        .endw
        mov count,0
        mov y,80
        inc lines
        inc x
    .endw


ENDM

;================================================== End Drawing Opening Box ==============================================


;================================================== Start Drawing Game Name ==============================================
Draw_Game_Name MACRO x,y,Game_Name1,Game_Name1

    MOV AH,02H
    MOV BX,0
    MOV DH, 12 ;Row Number
    MOV DL, 32 ;Column Number
    INT 10H

    mov dx, offset Game_Name2
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 11 ;Row Number
    MOV DL, 35 ;Column Number
    INT 10H

    mov dx, offset Game_Name1
    mov ah,09h
    int 21h

ENDM

;================================================== End Drawing Game Name ==============================================

;================================================== Start Drawing Opening Name Box ==============================================

Draw_Name_Box Macro x,y,count,lines,Player_Name_Message,Continue_Message,Created_By,C1,C2


;printing the upper lines of the box
mov x,145
mov y,120
mov count,0
mov lines,0
    .while lines < 2
        .while count < 350
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 02h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,145
        inc lines
        inc y
    .endw

;printing the lower lines of the box
mov x,145
mov y,140
mov count,0
mov lines,0
    .while lines < 2
        .while count < 350
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 03h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,145
        inc lines
        inc y
    .endw

;printing the left lines of the box
mov x,145
mov y,120
mov count,0
mov lines,0

    .while lines < 2
        .while count < 20
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 04h
            mov ah, 0ch
            int 10h
            inc y
            inc count
        .endw
        mov count,0
        mov y,120
        inc lines
        inc x
    .endw

;printing the left lines of the box
mov x,495
mov y,120
mov count,0
mov lines,0

    .while lines < 2
        .while count < 20
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 05h
            mov ah, 0ch
            int 10h
            inc y
            inc count
        .endw
        mov count,0
        mov y,120
        inc lines
        inc x
    .endw

;printing enter player name messsage 
    MOV AH,02H
    MOV BX,0
    MOV DH, 16 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Player_Name_Message
    mov ah,09h
    int 21h


;printing click enter to continue message
    MOV AH,02H
    MOV BX,0
    MOV DH, 19 ;Row Number
    MOV DL, 30 ;Column Number
    INT 10H

    mov dx, offset Continue_Message
    mov ah,09h
    int 21h

;printing Creator's name
    MOV AH,02H
    MOV BX,0
    MOV DH, 21 ;Row Number
    MOV DL, 10 ;Column Number
    INT 10H

    mov dx, offset Created_By
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 21 ;Row Number
    MOV DL, 30 ;Column Number
    INT 10H

    mov dx, offset C1
    mov ah,09h
    int 21h

    MOV AH,02H
    MOV BX,0
    MOV DH, 21 ;Row Number
    MOV DL, 50 ;Column Number
    INT 10H

    mov dx, offset C2
    mov ah,09h
    int 21h

ENDM

;================================================== End Drawing Opening Name Box ==============================================

;================================================== Start Drawing Rules Page ==============================================

Print_Rules MACRO Rules_Message,Rule_1,Rule_2,Rule_3,Continue_Message

;printing the upper lines of the box
mov x,145
mov y,30
mov count,0
mov lines,0
    .while lines < 2
        .while count < 350
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 02h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,145
        inc lines
        inc y
    .endw

;printing the lower lines of the box
mov x,145
mov y,150
mov count,0
mov lines,0
    .while lines < 2
        .while count < 350
            mov bh,0
            mov cx, x
            mov dx, y
            mov al, 03h
            mov ah, 0ch
            int 10h
            inc x
            inc count
        .endw
        mov count,0
        mov x,145
        inc lines
        inc y
    .endw





    ;printing Rules Title
    MOV AH,02H
    MOV BX,0
    MOV DH, 5 ;Row Number
    MOV DL, 28 ;Column Number
    INT 10H

    mov dx, offset Rules_Message
    mov ah,09h
    int 21h

    ;printing Rule1
    MOV AH,02H
    MOV BX,0
    MOV DH, 10 ;Row Number
    MOV DL, 20 ;Column Number
    INT 10H

    mov dx, offset Rule_1
    mov ah,09h
    int 21h

    ;printing Rule2
    MOV AH,02H
    MOV BX,0
    MOV DH, 12 ;Row Number
    MOV DL, 16 ;Column Number
    INT 10H

    mov dx, offset Rule_2
    mov ah,09h
    int 21h

    ;printing Rule3
    MOV AH,02H
    MOV BX,0
    MOV DH, 14 ;Row Number
    MOV DL, 14 ;Column Number
    INT 10H

    mov dx, offset Rule_3
    mov ah,09h
    int 21h

    ;printing Continue Message
    MOV AH,02H
    MOV BX,0
    MOV DH, 20 ;Row Number
    MOV DL, 28 ;Column Number
    INT 10H

    mov dx, offset Continue_Message
    mov ah,09h
    int 21h

ENDM
;================================================== End Drawing Rules Page ==============================================

;================================================== Start Take starting coordinates ==============================================
Take_Start_coordinates MACRO Infinite_loop, X_start, Y_start

;taking starting point coordinates
mov ax,0
int 33h

;show cursor on screen
mov ax,1
int 33h
mov Infinite_loop,3
.while Infinite_loop > 2
    ;get info for button press
    mov ax,5
    int 33h

    ;if left button is pressed
    .if ax == 1
        ;takes cordinates of position
        mov ax,3
        mov X_start,cx ; X-position, x co-ordinates are stored in variable x
        mov Y_start,dx ; Y-position, y co-ordinates are stored in variable y
        int 33h
        ;exit the program
        mov Infinite_loop,1
    .endif

.endw

mov Infinite_loop,1

ENDM

;================================================== End Take starting coordinates ==============================================

;================================================== Start Take Ending coordinates ==============================================
Take_End_coordinates MACRO Infinite_loop, X_end, Y_end

mov Infinite_loop,3
.while Infinite_loop > 2
    ;get info for button press
    mov ax,5
    int 33h

    ;if left button is pressed
    .if ax == 1
        ;takes cordinates of position
        mov ax,3
        mov X_end,cx ; X-position, x co-ordinates are stored in variable x
        mov Y_end,dx ; Y-position, y co-ordinates are stored in variable y
        int 33h
        ;exit the program
        mov Infinite_loop,1
    .endif

.endw

mov Infinite_loop,1

ENDM



;================================================== Start value swapping ==============================================

Swap_Candies MACRO Index_Counter_Start,Index_Counter_End,temp1, temp2,Grid_Array,Candy_crushed

    mov si, offset Grid_Array
    dec Index_Counter_End
    dec Index_Counter_Start

    .while Index_Counter_Start > 0

        inc si
        dec Index_Counter_Start

    .endw
        
    mov bl,[si]
    mov temp1,bl

    mov dl,temp1
    add dl,48
    mov ah,02H
    int 21h


    mov di, offset Grid_Array

    .while Index_Counter_End > 0

        inc di
        dec Index_Counter_End

    .endw

    mov bl,[di]
    mov temp2,bl

    ; mov dl,temp2
    ; add dl,48
    ; mov ah,02H
    ; int 21h

    mov bl,temp1
    mov [di],bl

    mov bl,temp2
    mov [si],bl

    mov bl,temp1
    mov Candy_crushed,bl


ENDM
;================================================== End value swapping ==============================================

;================================================== Start check valid move ==============================================

Check_Move Macro Index_Counter_Start,Index_Counter_End,Strat_Index,End_Index,Grid_Array,temp1,temp2

    mov si,offset Grid_Array
    mov cl,Index_Counter_End
    mov End_Index, cl
    mov cl,Index_Counter_Start
    mov Strat_Index,cl
    dec End_Index
    dec Strat_Index

    .while Strat_Index > 0

        inc si
        dec Strat_Index

    .endw
        
    mov bl,[si]
    mov temp1,bl

    mov di, offset Grid_Array

    .while End_Index > 0

        inc di
        dec End_Index

    .endw

    mov bl,[di]
    mov temp2,bl
        

ENDM

;================================================== End check valid move ==============================================

;================================================== Start Printing Name on level Screen ==============================================
Print_NAME MACRO Player_Name,Player_Name_Label

    ;printing Player_Name_Label
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 3 ;Column Number
    INT 10H

    mov dx, offset Player_Name_Label
    mov ah,09h
    int 21h

    ;printing Player_Name
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 8 ;Column Number
    INT 10H

    mov dx, offset Player_Name
    mov ah,09h
    int 21h
ENDM

;================================================== END Printing Name on level Screen ==============================================

;================================================== Start Printing level on level Screen ==============================================
Print_Level_1 MACRO Level_1

    ;printing Level_1
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 35 ;Column Number
    INT 10H

    mov dx, offset Level_1
    mov ah,09h
    int 21h
ENDM

;================================================== END Printing level on level Screen ==============================================

;================================================== Start Printing level on level Screen ==============================================
Print_Level_2 MACRO Level_2

    ;printing Level_1
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 35 ;Column Number
    INT 10H

    mov dx, offset Level_2
    mov ah,09h
    int 21h
ENDM

;================================================== END Printing level on level Screen ==============================================

;================================================== Start Printing level on level Screen ==============================================
Print_Level_3 MACRO Level_3

    ;printing Level_1
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 35 ;Column Number
    INT 10H

    mov dx, offset Level_3
    mov ah,09h
    int 21h
ENDM

;================================================== END Printing level on level Screen ==============================================

;================================================== Start Printing score on level Screen ==============================================
Print_Score MACRO Score_Label

    ;printing Score_Label
    MOV AH,02H
    MOV BX,0
    MOV DH, 1 ;Row Number
    MOV DL, 65 ;Column Number
    INT 10H

    mov dx, offset Score_Label
    mov ah,09h
    int 21h

    ; ;printing Player_Score_var
    ; MOV AH,02H
    ; MOV BX,0
    ; MOV DH, 1 ;Row Number
    ; MOV DL, 72 ;Column Number
    ; INT 10H

    ; mov dx, offset Player_Score_var
    ; mov ah,09h
    ; int 21h
ENDM

;================================================== END Printing Score on level Screen ==============================================

;================================================== Start Printing moves left on level Screen ==============================================
Print_Moves MACRO Moves_Label

    ;printing Moves_Label
    MOV AH,02H
    MOV BX,0
    MOV DH, 23 ;Row Number
    MOV DL, 3 ;Column Number
    INT 10H

    mov dx, offset Moves_Label
    mov ah,09h
    int 21h

    ; ;printing Moves_left
    ; MOV AH,02H
    ; MOV BX,0
    ; MOV DH, 23 ;Row Number
    ; MOV DL, 15 ;Column Number
    ; INT 10H

    ; mov dx, offset Moves_left
    ; mov ah,09h
    ; int 21h
ENDM

;================================================== END Printing moves left on level Screen ==============================================

;================================================== Start Printing Not_Valid_Move_Label on level Screen ==============================================
Print_Not_Valid_Move MACRO Not_Valid_Move_Label

    ;printing Not_Valid_Move_Label
    MOV AH,02H
    MOV BX,0
    MOV DH, 23 ;Row Number
    MOV DL, 30 ;Column Number
    INT 10H

    mov dx, offset Not_Valid_Move_Label
    mov ah,09h
    int 21h
ENDM

;================================================== END Printing Not_Valid_Move_Label on level Screen ==============================================

;================================================== Start Printing Valid_Move_Label on level Screen ==============================================
Print_Valid_Move MACRO Valid_Move_Label

    ;printing Valid_Move_Label
    MOV AH,02H
    MOV BX,0
    MOV DH, 23 ;Row Number
    MOV DL, 30 ;Column Number
    INT 10H

    mov dx, offset Valid_Move_Label
    mov ah,09h
    int 21h
ENDM

;================================================== END Printing Valid_Move_Label on level Screen ==============================================

;================================================== Start updating palyer score ==============================================
Update_Score MACRO Candy_crushed,Player_Score_var,Bomb_candy

    .if Bomb_candy > 0

        mov bx,Player_Score_var
        add bx, 10
        mov Player_Score_var,bx

    .elseif Candy_crushed == 1

        mov bx,Player_Score_var
        add bx, 4
        mov Player_Score_var,bx

    .elseif Candy_crushed == 2

        mov bx,Player_Score_var
        add bx, 3
        mov Player_Score_var,bx

    .elseif Candy_crushed == 3

        mov bx,Player_Score_var
        add bx, 5
        mov Player_Score_var,bx

    .elseif Candy_crushed == 4

        mov bx,Player_Score_var
        add bx, 4
        mov Player_Score_var,bx

    .elseif Candy_crushed == 5

        mov bx,Player_Score_var
        add bx, 3
        mov Player_Score_var,bx

    .endif

ENDM

;================================================== END updating palyer score ==============================================

;================================================== START DRAWING Play again SQUARE SHAPE =============================================

Draw_Play_Again_shape Macro x,y,count,lines


;add in x and y to make them centered in the box 
mov x,75
mov y,70

;printing the Top line of the Square 

.while lines <=40

    .while count <=490

        mov bh,0
        mov cx, x
        mov dx, y
        mov al, 07h
        mov ah, 0ch
        int 10h
        inc x

        inc count

    .endw

    mov count,0
    inc y
    sub x,491
    inc lines

.endw

ENDM

;================================================== END DRAWING play again SQUARE SHAPE =============================================

;================================================== Start Play again string on level Screen ==============================================
Print_Play_Again MACRO Play_again_str1,Play_again_str2

    ;printing Play_again_str1
    MOV AH,02H
    MOV BX,0
    MOV DH, 10 ;Row Number
    MOV DL, 27 ;Column Number
    INT 10H

    mov dx, offset Play_again_str1
    mov ah,09h
    int 21h

    ;printing Play_again_str2
    MOV AH,02H
    MOV BX,0
    MOV DH, 12 ;Row Number
    MOV DL, 18 ;Column Number
    INT 10H

    mov dx, offset Play_again_str2
    mov ah,09h
    int 21h
ENDM

;================================================== END Play again string on level Screen ==============================================


;================================================= Start Crushing candies on swap ======================================================

Crush_Candies MACRO Next1, Next2

    .if Next1 == 1

        mov Next1,2
        mov Next2,3

    .elseif Next1 == 2

        mov Next1,4
        mov Next2,5

    .elseif Next1 == 3

        mov Next1,1
        mov Next2,5

    .elseif Next1 == 4

        mov Next1,2
        mov Next2,3

    .elseif Next1 == 5

        mov Next1,4
        mov Next2,1

    .endif

ENDM

;================================================= END Crushing candies on swap ======================================================


;================================================= Start Crushing candies on BOMB ======================================================

Bomb_Crushing MACRO Bomb_candy,Grid_Array,count,Rand_Array

    mov si, offset Grid_Array
    mov di,offset Rand_Array

    .while count < 49
        mov bl,[si]
        .if Bomb_candy == bl

            mov bl,[di]
            mov [si],bl

        .endif
        inc di

        inc si
        inc count
    .endw

ENDM

;================================================= END Crushing candies on BOMB ======================================================