Sets
t time index / 0*180 /
tplan(t) time index starting in the planning period / 50*180 /
tcost(t) time periods for the cost calculation / 50*90 /
tpsi(t) time periods for computing the trade ratio / 50*130 /
tfront(t) front end time periods for point and nonpoint sources / 0*49 /

i nonpoint bin index / nps01*nps10 /
j point source index / ps1 /
l lag length index / l00*l40 /

binlag(i,l) lag lengths within each nonpoint bin
$ontext
      / nps01.(l36,l37,l38,l39,l40)
	nps02.(l32,l33,l34,l35,l36)
	nps03.(l28,l29,l30,l31,l32)
	nps04.(l24,l25,l26,l27,l28)
	nps05.(l20,l21,l22,l23,l24)
	nps06.(l16,l17,l18,l19,l20)
	nps07.(l12,l13,l14,l15,l16)
	nps08.(l08,l09,l10,l11,l12)
	nps09.(l04,l05,l06,l07,l08)
	nps10.(l00,l01,l02,l03,l04) /
      / nps01.(l18,l19,l20)
	nps02.(l16,l17,l18)
	nps03.(l14,l15,l16)
	nps04.(l12,l13,l14)
	nps05.(l10,l11,l12)
	nps06.(l08,l09,l10)
	nps07.(l06,l07,l08)
	nps08.(l04,l05,l06)
	nps09.(l02,l03,l04)
	nps10.(l00,l01,l02) /
      / nps01.(l00)
 	nps02.(l00)
	nps03.(l00)
	nps04.(l00)
	nps05.(l00)
	nps06.(l00)
	nps07.(l00)
	nps08.(l00)
	nps09.(l00)
	nps10.(l00) /
      / nps01.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps02.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps03.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps04.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps05.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps06.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps07.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps08.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps09.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20)
	nps10.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20) /
$offtext

      / nps01.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps02.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps03.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps04.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps05.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps06.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps07.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps08.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps09.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40)
	nps10.(l00,l01,l02,l03,l04,l05,l06,l07,l08,l09,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,l25,l26,l27,l28,l29,l30,l31,l32,l33,l34,l35,l36,l37,l38,l39,l40) /

u damage cost index / 0*4 /
v point source abatement cost index / 0*4 /

Rslt result index / dvalue, gvalue, firstbestPSload, firstbestNPSload, firstbestabatementcost, firstbestdamagecost, firstbesttotalcost, scenario1PSload, scenario1NPSload, scenario1abatementcost, scenario1damagecost, scenario1totalcost, scenario1TRScap, scenario1costratio, scenario2PSload, scenario2NPSload, scenario2abatementcost, scenario2damagecost, scenario2totalcost, scenario2TRScap,  scenario2costratio, scenario3PSload, scenario3NPSload, scenario3abatementcost, scenario3damagecost, scenario3totalcost, scenario3TRScap, scenario3costratio, scenario4PSload, scenario4NPSload, scenario4abatementcost, scenario4damagecost, scenario4totalcost, scenario4TRScap, scenario4costratio / 
;

Scalar
delta social rate of time preference / 0.07 /
AgTMDL load target for 2025 for agricultural sources under the Ches Bay TMDL / 71.9 /
WasteTMDL load target for 2025 for wastewater sources under the Ches Bay TMDL / 37.9 /
;

Parameters
d damage cost coefficient

c(i) nonpoint abatement cost coefficients
      / nps01 0.3830000027
	nps02 0.01683289506
	nps03 0.01283365291
	nps04 0.001834550126
	nps05 0.000269343924
	nps06 0.001259197845
	nps07 0.00120767005
	nps08 0.00002037526
	nps09 0.00000154376
	nps10 0.0061282038 /

theta(i) nonpoint abatement cost exponents
      / nps01 1.7539
	nps02 3.4837
	nps03 4.2255
	nps04 4.9129
	nps05 5.8266
	nps06 5.5191
	nps07 5.5591
	nps08 6.3941
	nps09 6.9915
	nps10 5.1059 /

g(j) point source abatement cost coefficients

gtheta(j) point abatement cost exponential parameter / ps1 0.079 /

rbar(i) baseline lbs per acre from nonpoint bin i
      / nps01 25.2378
	nps02 26.4901
	nps03 23.0506
	nps04 24.7168
	nps05 25.2914
	nps06 21.4991
	nps07 20.5679
	nps08 30.8425
	nps09 31.5169
	nps10 14.6441 /

A(i) million acres in nonpoint bin i
      / nps01 0.76695514
	nps02 0.79330594
	nps03 1.10371416
	nps04 0.84881127
	nps05 1.11368041
	nps06 0.73999177
	nps07 0.84526177
	nps08 1.04701313
	nps09 0.3517381
	nps10 1.3037471 /

df(i) delivery factor in nonpoint bin i
      / nps01 0.05
	nps02 0.15
	nps03 0.25
	nps04 0.35
	nps05 0.45
	nps06 0.55
	nps07 0.65
	nps08 0.75
	nps09 0.85
	nps10 0.95 /

wbar(j) baseline discharges from each source / ps1 43.585 /
*wbar(j) baseline discharges from each source / ps1 52 /

oth(t) background loads discharged from all other sectors

Lag(l) lag length
      / l00 00, l01 01, l02 02, l03 03, l04 04, l05 05, l06 06, l07 07, l08 08, l09 09, l10 10,
	l11 11, l12 12, l13 13, l14 14, l15 15, l16 16, l17 17, l18 18, l19 19, l20 20, l21 21,
	l22 22, l23 23, l24 24, l25 25, l26 26, l27 27, l28 28, l29 29, l30 30, l31 31, l32 32,
	l33 33, l34 34, l35 35, l36 36, l37 37, l38 38, l39 39, l40 40 /

p(i) proportion of acres in bin i with lag length l

Psi(i,l,t) trade ratio for source with lag l in period t
TRScap(t) per period cap under trade ratio system

Result(Rslt,u,v)
;

p(i) = 1/sum(binlag(i,l),1) ;
**assumes that the acreage for each lag length is distributed equally among bins (otherwise p would be indexed by i AND l**

*oth(t) = 0 ;
oth(t) = 82.117 ;

Variables
z total social cost function
abmt present value abatement costs
Abmtcost abatement cost over the relevant time horizon
Dmgcost damage cost over the relevant time horizon
Totcost total cost over the relevant time horizon
;


Positive Variables
r(i,l,t) runoff discharged from agricultural sources (lbs. per acre)
w(j,t) load discharged from wastewater sources (million lbs.)
Load(i,l,t) loads delivered by each nonpoint source in each period (million lbs.)
TotalLoad(t) combined point and nonpoint source loads delivered in each period (million lbs.)
dmg present value damage costs
;

w.up(j,t) = wbar(j) ;
r.up(i,l,t) = rbar(i) ;

r.fx(i,l,tfront(t)) = rbar(i) ;
w.fx(j,tfront(t)) = wbar(j) ;


Equations
Abatementcost pollution abatement cost function
Damagecost pollution damage cost function
Totalcost sum of abatment and damage costs
NPSdeliveries deliveries from nonpoint sources
TotalDeliveries total deliveries each period
ForwardMarketCap equation defining the total cap on per-period deliveries under a forward market system
ForwardMarketCapConstant equation defining a constant cap on deliveries under a forward market system
TradeRatioCap equation defining the total cap on per-period discharges under a trade ratio system
AbmtHorizon equation to compute abatement cost over the relevant time horizon
DmgHorizon equation to compute damage cost over the relevant time horizon
ZHorizon equation to compute total cost over the relevant time horizon
;


Totalcost.. z =e= abmt + dmg ;

Abatementcost.. abmt =e= sum((i,tplan(t),binlag(i,l)), ( (c(i)/(1+theta(i)))*(rbar(i)-r(i,l,t))**(1+theta(i)))*(1+delta)**(51-ord(t)) )  +  sum( (j,tplan(t)), (g(j)/gtheta(j))*exp((wbar(j)-w(j,t))*gtheta(j))*(1+delta)**(51-ord(t)) )  ;

Damagecost.. dmg =e= sum(tplan(t), (1/3)*d*TotalLoad(t)*TotalLoad(t)*TotalLoad(t)*(1+delta)**(51-ord(t)) ) ;

NPSdeliveries(i,l,t)$binlag(i,l).. Load(i,l,t) =e= p(i)*df(i)*A(i)*r(i,l,t-Lag(l)) ;

TotalDeliveries(t).. TotalLoad(t) =e= sum((i,binlag(i,l)), Load(i,l,t)) + sum(j, w(j,t)) + oth(t) ;

TradeRatioCap(t)$(tplan(t)).. sum((i,binlag(i,l)), (p(i)*df(i)*A(i)*r(i,l,t))/Psi(i,l,t)) + sum(j, w(j,t)) =e= TRScap(t) ;

AbmtHorizon.. Abmtcost =e= 0.001*sum((i,tcost(t),binlag(i,l)), ((c(i)/(1+theta(i)))*(rbar(i)-r(i,l,t))**(1+theta(i)))*(1+delta)**(51-ord(t)) )  +  0.001*sum((j,tcost(t)), (g(j)/gtheta(j))*exp((wbar(j)-w(j,t))*gtheta(j))*(1+delta)**(51-ord(t)) ) ;

DmgHorizon.. Dmgcost =e= 0.001*sum(tcost(t), (1/3)*d*TotalLoad(t)*TotalLoad(t)*TotalLoad(t)*(1+delta)**(51-ord(t)) ) ;

ZHorizon.. Totcost =e= Abmtcost + Dmgcost ;


Model Firstbest / Totalcost, Abatementcost, Damagecost, NPSdeliveries, TotalDeliveries, AbmtHorizon, DmgHorizon, ZHorizon / ;

Model TradeRatioEquilibrium / Totalcost, Abatementcost, Damagecost, NPSdeliveries, TotalDeliveries, TradeRatioCap, AbmtHorizon, DmgHorizon, ZHorizon / ;


loop((u,v),
d = 0.0003474 + (ord(u)-1)**2*0.0002 ;
g('ps1') = 10.97075 + (ord(v)-1)**2*4 ;
*d = 0.0005 + (ord(u)-1)*0.002 ;
*g('ps1') = 20 + (ord(v)-1)*5 ;
*d = 0.0003474 + 2*0.0004 ;
*g('ps1') = 10.97075 + 2*8 ;
Result('dvalue',u,v) = d ;
Result('gvalue',u,v) = g('ps1') ;

Solve Firstbest using nlp minimizing z ;
Result('firstbestPSload',u,v) = sum(j, w.l(j,'90')) ;
Result('firstbestNPSload',u,v) = sum((i,binlag(i,l)), Load.l(i,l,'90')) ;
Result('firstbestabatementcost',u,v) = Abmtcost.l ;
Result('firstbestdamagecost',u,v) = Dmgcost.l ;
Result('firstbesttotalcost',u,v) = Totcost.l ;

Psi(i,l,t) = 10000 ;
Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = p(i)*A(i)*df(i)*(g('ps1')*exp((wbar('ps1')-w.l('ps1',t))*gtheta('ps1'))) / (c(i)*(rbar(i)-r.l(i,l,t))**(theta(i))) ;
TRScap(t) = sum((i,binlag(i,l)), p(i)*df(i)*A(i)*r.l(i,l,t)/Psi(i,l,t)) + sum(j, w.l(j,t)) ;
Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = (1+delta)**(ord(l)-1) ;
TRScap(t)$(tpsi(t)) = sum((i,binlag(i,l)), p(i)*df(i)*A(i)*r.l(i,l,'90')/Psi(i,l,'90')) + sum(j, w.l(j,'90')) ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
Result('scenario1PSload',u,v) = sum(j, w.l(j,'90')) ;
Result('scenario1NPSload',u,v) = sum((i,binlag(i,l)), Load.l(i,l,'90')) ;
Result('scenario1abatementcost',u,v) = Abmtcost.l ;
Result('scenario1damagecost',u,v) = Dmgcost.l ;
Result('scenario1totalcost',u,v) = Totcost.l ;
Result('scenario1TRScap',u,v) = TRScap('90') ;
Result('scenario1costratio',u,v) = Result('scenario1totalcost',u,v)/Result('firstbesttotalcost',u,v) ;

Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = 1 ;
TRScap(t)$(tpsi(t)) = Result('firstbestNPSload',u,v) + Result('firstbestPSload',u,v) ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
Result('scenario2PSload',u,v) = sum(j, w.l(j,'90')) ;
Result('scenario2NPSload',u,v) = sum((i,binlag(i,l)), Load.l(i,l,'90')) ;
Result('scenario2abatementcost',u,v) = Abmtcost.l ;
Result('scenario2damagecost',u,v) = Dmgcost.l ;
Result('scenario2totalcost',u,v) = Totcost.l ;
Result('scenario2TRScap',u,v) = sum((i,binlag(i,l)), p(i)*df(i)*A(i)*r.l(i,l,'90')/Psi(i,l,'90')) + sum(j, w.l(j,'90')) ;
Result('scenario2costratio',u,v) = Result('scenario2totalcost',u,v)/Result('firstbesttotalcost',u,v) ;

Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = (1+delta)**(ord(l)-1) ;
TRScap(t)$(tpsi(t)) = AgTMDL + WasteTMDL ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
Result('scenario3PSload',u,v) = sum(j, w.l(j,'90')) ;
Result('scenario3NPSload',u,v) = sum((i,binlag(i,l)), Load.l(i,l,'90')) ;
Result('scenario3abatementcost',u,v) = Abmtcost.l ;
Result('scenario3damagecost',u,v) = Dmgcost.l ;
Result('scenario3totalcost',u,v) = Totcost.l ;
Result('scenario3TRScap',u,v) = sum((i,binlag(i,l)), p(i)*df(i)*A(i)*r.l(i,l,'90')/Psi(i,l,'90')) + sum(j, w.l(j,'90')) ;
Result('scenario3costratio',u,v) = Result('scenario3totalcost',u,v)/Result('firstbesttotalcost',u,v) ;

Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = 1 ;
TRScap(t)$(tpsi(t)) = AgTMDL + WasteTMDL ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
Result('scenario4PSload',u,v) = sum(j, w.l(j,'90')) ;
Result('scenario4NPSload',u,v) = sum((i,binlag(i,l)), Load.l(i,l,'90')) ;
Result('scenario4abatementcost',u,v) = Abmtcost.l ;
Result('scenario4damagecost',u,v) = Dmgcost.l ;
Result('scenario4totalcost',u,v) = Totcost.l ;
Result('scenario4TRScap',u,v) = sum((i,binlag(i,l)), p(i)*df(i)*A(i)*r.l(i,l,'90')/Psi(i,l,'90')) + sum(j, w.l(j,'90')) ;
Result('scenario4costratio',u,v) = Result('scenario4totalcost',u,v)/Result('firstbesttotalcost',u,v) ;

);


scalar col1 column number / 1 / ;
scalar col6 column number / 6 / ;

file output01 / FirstBestPSLoads.dat / ;
output01.pw = 3000 ;
output01.nj = 2 ;
put output01 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('firstbestPSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output02 / FirstBestNPSLoads.dat / ;
output02.pw = 3000 ;
output02.nj = 2 ;
put output02 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('firstbestNPSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output03 / FirstBestTotalCost.dat / ;
output03.pw = 3000 ;
output03.nj = 2 ;
put output03 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('firstbesttotalcost',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output04 / Scenario1PSLoads.dat / ;
output04.pw = 3000 ;
output04.nj = 2 ;
put output04 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario1PSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output05 / Scenario1NPSLoads.dat / ;
output05.pw = 3000 ;
output05.nj = 2 ;
put output05 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario1NPSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output06 / Scenario1CostRatio.dat / ;
output06.pw = 3000 ;
output06.nj = 2 ;
put output06 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario1costratio',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output07 / Scenario2PSLoads.dat / ;
output07.pw = 3000 ;
output07.nj = 2 ;
put output07 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario2PSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output08 / Scenario2NPSLoads.dat / ;
output08.pw = 3000 ;
output08.nj = 2 ;
put output08 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario2NPSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output09 / Scenario2CostRatio.dat / ;
output09.pw = 3000 ;
output09.nj = 2 ;
put output09 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario2costratio',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output10 / Scenario3PSLoads.dat / ;
output10.pw = 3000 ;
output10.nj = 2 ;
put output10 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario3PSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output11 / Scenario3NPSLoads.dat / ;
output11.pw = 3000 ;
output11.nj = 2 ;
put output11 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario3NPSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output12 / Scenario3CostRatio.dat / ;
output12.pw = 3000 ;
output12.nj = 2 ;
put output12 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario3costratio',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output13 / Scenario4PSLoads.dat / ;
output13.pw = 3000 ;
output13.nj = 2 ;
put output13 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario4PSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output14 / Scenario4NPSLoads.dat / ;
output14.pw = 3000 ;
output14.nj = 2 ;
put output14 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario4NPSload',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output15 / Scenario4CostRatio.dat / ;
output15.pw = 3000 ;
output15.nj = 2 ;
put output15 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario4costratio',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output16 / Scenario1TRScap.dat / ;
output16.pw = 3000 ;
output16.nj = 2 ;
put output16 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario1TRScap',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output17 / Scenario2TRScap.dat / ;
output17.pw = 3000 ;
output17.nj = 2 ;
put output17 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario2TRScap',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output18 / Scenario3TRScap.dat / ;
output18.pw = 3000 ;
output18.nj = 2 ;
put output18 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario3TRScap',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;

file output19 / Scenario4TRScap.dat / ;
output19.pw = 3000 ;
output19.nj = 2 ;
put output19 ;
loop(u, put @col6 Result('dvalue',u,'0'):10:4; col6=col6+12;) ; put / ; col6=6 ;
loop(v,
	put @col1 Result('gvalue','0',v):5:1; col1=col1+5 ;
	loop(u, put @col1 Result('scenario4TRScap',u,v):10:4; col1=col1+12; ) ; put / ;
	col1=1 ;
) ;


