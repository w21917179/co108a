// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.



@SCREEN
D=A
@addr
M=D     // addr = 16384

@24575
D=A
@max
M=D     // max = 24575

@16384
D=A
@min
M=D     // min = 16384



@END
0;JMP



(LOOP)  //color black
    @addr
    A=M
    M=-1
        @addr  // if addr = max goto END
        D=M
        @max
        D=D-M
        @END
        D;JEQ 
    @addr
    M=M+1
    @LOOP
    0;JMP



(WHITE)  //color white
    @addr
    A=M
    M=0
        @addr  // if addr = min goto END
        D=M
        @min
        D=D-M
        @END
        D;JEQ 
    @addr
    M=M-1
    @WHITE
    0;JMP


(END)
        @24576  //  if keyboard unclick,go to white
        D=M
        @WHITE
        D;JEQ
        @24576  //  if keyboard click,go to black (loop)
        D=M
        @LOOP
        D;JNE
    @END
    0;JMP
