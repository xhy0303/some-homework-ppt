	.ORIG X3100
	;LEA R6,SADDRESS	;指向数据首地址
	;LEA R7,EADDR	;数据末尾 R7
	;LEA R4,DADD
	LD R4,DADD
BEGIN	LD R6,SADDRESS	;指向数据首地址
	AND R5,R5,#0
	ADD R5,R5,R6	;动态指针 R5	
	LDR R2,R6,#0
	ADD R1,R2,#1
JUDGE	BRnp CMP
	ADD R6,R6,#1
	BRnzp JUDGE 
CMP	LDR R3,R5,#0
	AND R1,R1,#0
	ADD R1,R1,R2
	NOT R1,R1
	ADD R1,R1,#1
	ADD R1,R1,R3
	BRP CHANGE
CONTI	ADD R5,R5,#1
	LD R7,EADDR
	NOT R7,R7
	ADD R7,R7,#1
	ADD R1,R5,R7
	BRnz CMP
	BRp STORE
	


STORE   STR R2,R4,#0
	AND R1,R1,#0
	ADD R1,R1,#-1
	STR R1,R0,#0
	ADD R4,R4,#1
	LD R7,Eaddr
	NOT R7,R7
	ADD R7,R7,#1
	ADD R1,R4,R7
	BRnz BEGIN
	BRp DONE

CHANGE	AND R2,R2,#0
	ADD R2,R2,R3
	AND R0,R0,#0
	ADD R0,R0,R5
	BRnzp CONTI
DONE
	AND R1,R1,#0
	AND R0,R0,#0
	LD R1,DADD
	LD R3,a
	NOT R3,R3
	ADD R3,R3,#1
	AND R2,R2,#0
	ADD R2,R2,#4
CON	LDR R4,R1,#0
	ADD R5,R4,R3
	BRn SKIP 
	ADD R0,R0,#1
SKIP	ADD R1,R1,#1
	ADD R2,R2,#-1
	BRp CON
	LD R6,A
	STR R0,R6,#0

	AND R1,R1,#0
	AND R7,R7,#0
	LD R1,DADD
	LD R3,b
	NOT R3,R3
	ADD R3,R3,#1
	AND R2,R2,#0
	ADD R2,R2,#8
Con	LDR R4,R1,#0
	ADD R5,R4,R3
	BRn Skip 
	ADD R7,R7,#1
Skip	ADD R1,R1,#1
	ADD R2,R2,#-1
	BRp Con
	NOT R0,R0
	ADD R0,R0,#1
	ADD R7,R0,R7
	LD R6,B
	STR R7,R6,#0
	
	HALT
SADDRESS .FILL X3200
EADDR    .FILL X320F
DADD	 .FILL X4000
Eaddr	 .FILL X400F
A	 .FILL X4100
a	 .FILL X0055
B	 .FILL X4101
b	 .FILL X004B
	.END