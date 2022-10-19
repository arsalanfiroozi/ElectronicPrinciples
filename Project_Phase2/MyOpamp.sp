
.subckt phase1opamp 4  20  15  100  200

***************** Models *************************
.model mynpn npn bf=100 VA=150 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
.model mypnp pnp bf=100 VA=70 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5

*************   Inputs    ********************
VID 17 0 ac=1 sin 0 600n 10k
VREFF 66 0 4

***************** Section 1 *************************
***************** 2mA Current Source *********
Q3 2 2 100 mypnp
R2E 2 200 2.15k
*I2E 2 200 2mA
Q4 3 2 100 mypnp
***************** Diffrential *********
Q2 6 5 3 mypnp
Q1 7 44 3 mypnp
EX1 44 4 102 0 0
Q5 10 8 7 mynpn
Q6 9 8 6 mynpn
RB1 8 100 1k
RB2 8 200 316
***************** Diffrential *********
*****************    Tail     *********
Q7 6 11 200 mynpn
Q8 7 11 200 mynpn
Q9 11 11 200 mynpn
R4C 100 11 2.15k
*I4C 100 11 2mA
***************** Active Load *********
Q10 9 9 12 mypnp
Q11 10 9 13 mypnp
Q12 12 12 100 mypnp
Q13 13 12 100 mypnp

***************** Section 2 *************************
Q14 200 10 14 mypnp
RE2 14 100 0.7k

***************** Section 3 *************************
Q15 15 14 100 mypnp
***************** Active Load *********
Q16 15 16 200 mynpn
Q17 16 16 200 mynpn
R1C 100 16 4.3k
*I1C 100 16 1mA

***************** DC Feedback ***********************
EDC 5 20 102 0 0
EDCi 101 0 15 66 1
RDC 101 102 100x
CDC 102 0 10000

.ends


.subckt phase1opampwithdcfeedback 4  20  15  100  200

*
***************** Models *************************
.model mynpn npn bf=100 VA=150 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5
.model mypnp pnp bf=100 VA=70 cjs=2.5pf cje=2pf cjc=2pf tf=0.1ns mje=0.5 mjs=0.5 mjc=0.5

*************   Inputs    ********************
VID 17 0 ac=1 sin 0 600n 10k
VREFF 66 0 3

***************** Section 1 *************************
***************** 2mA Current Source *********
Q3 2 2 100 mypnp
R2E 2 200 2.15k
*I2E 2 200 2mA
Q4 3 2 100 mypnp
***************** Diffrential *********
Q2 6 5 3 mypnp
Q1 7 44 3 mypnp
EX1 44 4 102 0 -0.5
EDC 5 20 102 0 0.5
Q5 10 8 7 mynpn
Q6 9 8 6 mynpn
RB1 8 100 1k
RB2 8 200 316
***************** Diffrential *********
*****************    Tail     *********
Q7 6 11 200 mynpn
Q8 7 11 200 mynpn
Q9 11 11 200 mynpn
R4C 100 11 2.15k
*I4C 100 11 2mA
***************** Active Load *********
Q10 9 9 12 mypnp
Q11 10 9 13 mypnp
Q12 12 12 100 mypnp
Q13 13 12 100 mypnp

***************** Section 2 *************************
Q14 200 10 14 mypnp
RE2 14 100 0.7k

***************** Section 3 *************************
Q15 15 14 100 mypnp
***************** Active Load *********
Q16 15 16 200 mynpn
Q17 16 16 200 mynpn
R1C 100 16 4.3k
*I1C 100 16 1mA

***************** DC Feedback ***********************
EDCi 101 0 15 66 1
RDC 101 102 100x
CDC 102 0 10000

.ends