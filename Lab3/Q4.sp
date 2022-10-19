Lab3 Simulation - Q4

.model mynpn npn bf=200 VA=170 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
******** DC
VCC 10 0 5V
VEE 11 0 -5V

******** Diff
q1 1 2 3 mynpn 
q2 5 4 3 mynpn 
rc 10 5 1.2k
rL 10 1 1.2k
lL 10 1 3.625u
cL  10 1 6.8n
rb1 2 0 1.2k
rb2 4 0 1.2k
cc1 2 7 100u
cc2 4 6 100u
r2 7 0 0.00001
vlo 6 0 sin(0 5mV 1x 0 0 0 )

********* Tail
q3 3 9 8 mynpn
re 8 11 1.2k
rb22 9 11 5.6k
rb21 9 0 3.3k
cin 12 9 100u
vm 12 0 sin(0 500mV 10k 0 0 0 )

.op
*.dc vin 0 5V 0.01
.tran 0.01n 1.5ms
.FFT v(1) fmin=0.5x fmax=1.5x np=10024
*.FFT v(4) np=10024
*.ac lin 500000 10 10000k

.end