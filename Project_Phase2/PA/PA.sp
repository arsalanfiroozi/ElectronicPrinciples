Project Phase 2 


*********** Models **************

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

.MODEL QBD135P PNP( IS = 4.815E-14  NF = 0.9897 ISE = 1.389E-14  NE = 1.6   BF = 124.2  IKF = 1.6  VAF = 222  NR = 0.9895  ISC = 1.295E-13  NC = 1.183   BR = 13.26   IKR = 0.29   VAR = 81.4   RB = 0.5  IRB = 1E-06    RBM = 0.5  RE = 0.165  RC = 0.096   XTB = 0  EG = 1.11  XTI = 3 CJE = 1.243E-10 VJE = 0.7313 
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

******** DC ******************
VDC 10 0 6V

******** Transistor **********
q1 10 1 2 QBD135 
q2 0 1 2 QBD135P 

******** Base ****************
vin 4 0 ac=1 sin(3 3V 1k 0 0 0 )
c1 4 1 100u

******** Output **************
c2 2 3 100u
RL 3 0 8

.op
.dc vin 0 5V 0.01
.tran 0.1n 6ms
.four 1k V(3)

.measure Po AVG P(RL) from=0 to=6ms
.measure Pcc AVG P(VDC) from=0 to=6ms

.end