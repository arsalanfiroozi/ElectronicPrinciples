Lab4 - Arsalan Firoozi 97102225

***************** Models *************************
.model mynpn npn bf=100 VA=150 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5

***************** DC *************************
VCC 100 0 10
VEE 200 0 -10

*************   Inputs    ********************
VID 3 0 ac=1 sin 0 200m 1k

***************** Stage 1 *************************
Q1 100 1 2 mynpn
Q2 4 5 2 mynpn
I1 2 200 1mA
R1 100 4 20k
R2 3 1 50

***************** stage 2 *************************
Q3 100 4 6 mynpn
R5 6 0 2k
I2 6 200 5mA

***************** Feedback ***********************
R3e 6 0 10k
R4e 5 0 0.9k

.op
.ac dec 40 0.1 1g
.tran 1n 18ms
.four 1k V(6)
.fft V(6) START=0 STOP=18m FMIN=0 FMAX=100k NP=1024

.end