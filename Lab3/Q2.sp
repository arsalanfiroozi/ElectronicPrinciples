Lab3 Simulation - Q2

.model mynpn npn bf=200 VA=170 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
******** DC
VCC 10 0 15V
VEE 20 0 -15V

q1 2 1 5 mynpn 
q2 4 3 5 mynpn 
Rc1 10 4 10.2k 
Rc2 10 2 10.2k
RE 5 20 6.9k

Vin1 3 0 sin(0 1mV 1k 0 0 0 )
*Vin2 1 0 sin(0 -0.5mV 1k 0 0 0 )
Vin2 1 0 sin(0 1mV 1k 0 0 0 )

.op
*.dc vin 0 5V 0.01
.tran 0.1n 6ms
*.FFT v(8) np=10024
*.FFT v(4) np=10024
*.ac lin 500000 10 10000k

.end