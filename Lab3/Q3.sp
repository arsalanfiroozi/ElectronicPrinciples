Lab3 Simulation - Q3

.model mynpn npn bf=200 VA=170 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
******** DC
VCC 10 0 10V
VEE 20 0 -10V

q1 3 2 1 mynpn 
q2 4 5 1 mynpn 
q3 1 6 7 mynpn 
q4 6 6 8 mynpn 
R1 10 3 6.75k 
R2 10 4 6.75k
R4 7 20 8.7
R3 9 6 4.8k
c1 9 0 100u
c2 8 0 100u
rd1 8 20 0.0001
rd2 9 10 0.0001
cn 4 3 1n

Eq 80 0 4 3 1

*Vin1 5 0 sin(0 0.5mV 1k 0 0 0 )
*Vin2 2 0 sin(0 -0.5mV 1k 0 0 0 )
Vin1 5 2 ac = 1V
Vincom 5 0 0



.op
*.dc vin 0 5V 0.01
*.tran 0.1n 6ms
*.FFT v(8) np=10024
*.FFT v(4) np=10024
.ac lin 500000 1 100x

.end