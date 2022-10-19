Lab2 Simulation - 1A

.model mynpn npn bf=100 VA=170 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
******** DC
VDC 10 0 10V

** Tab1
q2 2 1 0 mynpn 
rt1 2 10 5k
rt2 1 10 930k
ct1 40 1 100u

*rt5 40 50 2.5k
vin 40 0 sin(0 0.1mV 1k 0 0 0 )

** Tab2
q1 10 5 4 mynpn
rt3 4 0 5k
rt4 10 5 430k
ct2 2 5 100u

*ct6 4 60 100u
*rt9 60 0 100


*.op
*.dc vin 0 5V 0.01
.tran 0.1n 6ms
*.FFT v(8) np=10024
*.FFT v(4) np=10024
*.ac lin 500000 10 10000k

.end