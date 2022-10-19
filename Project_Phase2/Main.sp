Project Phase 2 - Arsalan Firoozi 97102225 

.inc 'PA.sp'
.inc 'Rreg.sp'

**** Regulator ****
VCC 1 0 sin 8 0.1 50 0 0 0
Xreg 1 100 Reg

**** PA  ****
Xpa 4 3 100 0 PA
RL 3 0 8

*** OpAmp ***
Xom 2 5 4 100 0 phase1opampwithdcfeedback

*** Input ***
VID 17 0 ac=1 sin 0 10u 10k
V1 5 55 3
V2 2 22 3
EN 55 0 17 0 -0.5
EP 22 0 17 0 +0.5

.option accurate=1
.op
.tran 0.1m 3ms

.measure Po AVG P(RL) from=0 to=3ms
.measure Pcc AVG P(VCC) from=0 to=3ms

.end