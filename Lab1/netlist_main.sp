Lab1 Simulation - tamame simulation ha ba taghir in code anjam shode.

.model mynpn npn bf=200 VA=170 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
*vs 1 0 PULSE(0 5V 0 1n 1n 1m 2m)
*rs 1 2 50
*cl 2 0 1u

******** DC
VDC 10 0 12V

******** Transistor
q1 2 1 3 mynpn 

******** Base
*vin 4 0 ac=1 
vin 4 0 sin(0 85mV 1k 0 0 0 )
*vin 4 0 0V
r10 6 4 10k 
c2 6 1 100u
r150 1 10 150k
r100 1 0 100k

******** Emitter
r39 5 0 3.9k
c100 3 0 100u
r3999 3 5 39

******** Collector
r399 2 10 3.9k

******** Ro Calculation
cto 2 8 100u
rt 8 0 10000k

*.op
*.dc vin 0 5V 0.01
.tran 0.1n 6ms
*.FFT v(8) np=10024
*.FFT v(4) np=10024
*.ac lin 500000 10 10000k

.end