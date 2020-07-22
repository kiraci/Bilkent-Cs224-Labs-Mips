.text

again:
​add ​$t0, $t0, $t1

​add ​$t0, $t0, $t1

​add ​$t0, $t0, $t1

​add ​$t0, $t0, $t1

​beq    ​$t0, $t1, next ​# inst. no. 1

​bne  ​$t0, $t1, again​# inst. no. 2

​add ​$t0, $t0, $t1

​add ​$t0, $t0, $t1

​next:​j​again​# inst. no. 3

​la​$t0, array​# inst. no. 4

​lw​$t1, array​# inst. no. 5

​bge​$t1, $t2, next​# inst. no. 6



​.data

​.space​7

​.align​2​# align: an assembler directive, see the Mars help menu or try and learn.

​array:​.word​10, 20, 30
