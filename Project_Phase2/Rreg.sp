
.inc 'myOpamp.sp'

.subckt Reg 100 3

****** Models ********
.MODEL QBD135 NPN( IS = 4.815E-14  NF = 0.9897 ISE = 1.389E-14  NE = 1.6   BF = 124.2  IKF = 1.6  VAF = 222  NR = 0.9895  ISC = 1.295E-13  NC = 1.183   BR = 13.26   IKR = 0.29   VAR = 81.4   RB = 0.5  IRB = 1E-06    RBM = 0.5  RE = 0.165  RC = 0.096   XTB = 0  EG = 1.11  XTI = 3 CJE = 1.243E-10 VJE = 0.7313 
+     MJE = 0.3476 
+     TF = 6.478E-10 
+     XTF = 29 
+     VTF = 2.648 
+     ITF = 3.35 
+     PTF = 0 
+     CJC = 3.04E-11 
+     VJC = 0.5642 
+     MJC = 0.4371 
+     XCJC = 0.15
+     TR = 1E-32 
+     CJS = 0 
+     VJS = 0.75 
+     MJS = 0.333 
+     FC = 0.9359 )
*

.MODEL D1N5221B D(ibv=20m rs=30 vb=2.4)


****************************************************************** Regulator ************************************************************************

***************** DC *************************
*VCC 100 50 8
*VCCS 50 0 ac=1 sin 0 0.1 50

************ Resistors ***********************
R3 100 1 5.6k
D1 0 1 D1N5221B
R1 2 0 2.2k
R2 2 3 3.3k

************ Transistor and Phase1 OpAmp
Q1 100 4 3 QBD135
X1 1 2 4 100 0 phase1opamp

.ends

