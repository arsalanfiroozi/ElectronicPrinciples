Lab2 Simulation - 1A

.model mynpn npn bf=100 VA=100 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
******** DC
VDC 10 0 11V
VEE 20 0 -10V

****** Q3 + Q4
q3 12 11 5 mynpn 
q4 13 11 2 mynpn 
rb1 11 10 10k
rb2 11 20 11k
rc1 12 10 10k
rc2 13 10 10k

****** Q1 + Q2
q2 2 1 3 mynpn
q1 5 4 3 mynpn 
ree 3 20 4.65k

vin 4 0 sin(0 0.5mV 1k 0 0 0 )
vinn 1 0 sin(0 -0.5mV 1k 0 0 0 )

cce 13 50 100u
rt1 50 0 5k


.op
*.dc vin 0 5V 0.01
.tran 0.1n 6ms
*.FFT v(8) np=10024
*.FFT v(4) np=10024
*.ac lin 500000 10 10000k

.end