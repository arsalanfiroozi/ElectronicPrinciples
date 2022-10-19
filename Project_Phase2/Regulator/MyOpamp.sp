* To use a subcircuit, the name must begin with 'X'.  For example:
* X1 1 2 3 4 5 uA741
*
* connections:   non-inverting input
*                |  inverting input
*                |  |  positive power supply
*                |  |  |  negative power supply
*                |  |  |  |  output
*                |  |  |  |  |
.subckt opamp741    1  2  5 3  4 
*
  c1   11 12 8.661E-12
  c2    6  7 30.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 10.61E6 -10E6 10E6 10E6 -10E6
  ga    6  0 11 12 188.5E-6
  gcm   0  6 10 99 5.961E-9
  iee  10  4 dc 15.16E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   3 11 5.305E3
  rc2   3 12 5.305E3
  re1  13 10 1.836E3
  re2  14 10 1.836E3
  ree  10 99 13.19E6
  ro1   8  5 50
  ro2   7 99 100
  rp    3  4 18.16E3
  vb    9  0 dc 0
  vc    3 53 dc 1
  ve   54  4 dc 1
  vlim  7  8 dc 0
  vlp  91  0 dc 40
  vln   0 92 dc 40
.model dx D(Is=800.0E-18 Rs=1)
.model qx NPN(Is=800.0E-18 Bf=93.75)
.ends

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