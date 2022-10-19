Lab4 - Arsalan Firoozi 97102225

***************** Models *************************
.model mynpn npn bf=100 VA=150 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5

***************** DC *************************
VCC 100 0 5

***************** Current Mirror *************
Q4 2 2 1 mynpn
Q5 1 1 0 mynpn
Q6 4 1 0 mynpn
Q7 3 2 4 mynpn
I1 100 2 1mA
*R1 100 3 2.5k
R1 100 3 3.5k

.op
.tran 1n 18ms

.end