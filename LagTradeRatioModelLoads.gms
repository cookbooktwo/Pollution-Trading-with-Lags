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
$offtext
Scenario / firstbest, scenario1*scenario4 /
Sourceparameter parameter index for source results  / discharge, delivery, psi /
$ontext
Aggregateparameter parameter index for aggregate results / xbin01*xbin10, xlag00*xlag40, x, w, cap /
$offtext
Aggregateparameter parameter index for aggregate results / x, w, cap /
Costparameter parameter index for cost results / abatement, damage, total, ratio /
;

Scalar
delta social rate of time preference / 0.03 /
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

wbar(j) baseline discharges from each source (Ches Bay TMDL 2017 target) / ps1 43.585 /

oth(t) background loads discharged from all other sectors

Lag(l) lag length
      / l00 00, l01 01, l02 02, l03 03, l04 04, l05 05, l06 06, l07 07, l08 08, l09 09, l10 10,
	l11 11, l12 12, l13 13, l14 14, l15 15, l16 16, l17 17, l18 18, l19 19, l20 20, l21 21,
	l22 22, l23 23, l24 24, l25 25, l26 26, l27 27, l28 28, l29 29, l30 30, l31 31, l32 32,
	l33 33, l34 34, l35 35, l36 36, l37 37, l38 38, l39 39, l40 40 /

p(i) proportion of acres in bin i with lag length l

Psi(i,l,t) trade ratio for source with lag l in period t
TRScap(t) per period cap under trade ratio system

NonpointResults(scenario,i,l,sourceparameter,t)
PointResults(scenario,j,sourceparameter,t)
AggregateResults(scenario,aggregateparameter,t)
CostResults(scenario,costparameter)
;

p(i) = 1/sum(binlag(i,l),1) ;
**assumes that the acreage for each lag length is distributed equally among bins (otherwise p would be indexed by i AND l**

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

r.fx(i,l,tfront(t))$(binlag(i,l)) = rbar(i) ;
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

Abatementcost.. abmt =e= sum((i,tplan(t),binlag(i,l)), ( (c(i)/(1+theta(i)))*(rbar(i)-r(i,l,t))**(1+theta(i)))*(1+delta)**(51-ord(t)) )   +   sum( (j,tplan(t)), (g(j)/gtheta(j))*exp((wbar(j)-w(j,t))*gtheta(j))*(1+delta)**(51-ord(t)) )  ;

Damagecost.. dmg =e= sum(tplan(t), (1/3)*d*TotalLoad(t)*TotalLoad(t)*TotalLoad(t)*(1+delta)**(51-ord(t)) ) ;

NPSdeliveries(i,l,t)$binlag(i,l).. Load(i,l,t) =e= p(i)*df(i)*A(i)*r(i,l,t-Lag(l)) ;

TotalDeliveries(t).. TotalLoad(t) =e= sum((i,binlag(i,l)), Load(i,l,t)) + sum(j, w(j,t)) + oth(t) ;

TradeRatioCap(t).. sum((i,binlag(i,l)), (p(i)*df(i)*A(i)*r(i,l,t))/Psi(i,l,t)) + sum(j, w(j,t)) =l= TRScap(t) ;

AbmtHorizon.. Abmtcost =e= 0.001*sum((i,tcost(t),binlag(i,l)), ((c(i)/(1+theta(i)))*(rbar(i)-r(i,l,t))**(1+theta(i)))*(1+delta)**(51-ord(t)) )  +  0.001*sum((j,tcost(t)), (g(j)/gtheta(j))*exp((wbar(j)-w(j,t))*gtheta(j))*(1+delta)**(51-ord(t)) ) ;

DmgHorizon.. Dmgcost =e= 0.001*sum(tcost(t), (1/3)*d*TotalLoad(t)*TotalLoad(t)*TotalLoad(t)*(1+delta)**(51-ord(t)) ) ;

ZHorizon.. Totcost =e= Abmtcost + Dmgcost ;



Model Firstbest / Totalcost, Abatementcost, Damagecost, NPSdeliveries, TotalDeliveries, AbmtHorizon, DmgHorizon, ZHorizon / ;

Model TradeRatioEquilibrium / Totalcost, Abatementcost, Damagecost, NPSdeliveries, TotalDeliveries, TradeRatioCap, AbmtHorizon, DmgHorizon, ZHorizon / ;


d = 0.0011474 ;
g('ps1') = 26.97075 ;

Solve Firstbest using nlp minimizing z ;
loop(binlag(i,l),
NonpointResults('firstbest',i,l,'discharge',t) = p(i)*A(i)*df(i)*r.l(i,l,t) ;
NonpointResults('firstbest',i,l,'delivery',t) = Load.l(i,l,t) ;
NonpointResults('firstbest',i,l,'psi',t) = 10000 ;
NonpointResults('firstbest',i,l,'psi',t)$(tpsi(t) and binlag(i,l)) = p(i)*A(i)*df(i)*(g('ps1')*exp((wbar('ps1')-w.l('ps1',t))*gtheta('ps1'))) / (c(i)*(rbar(i)-r.l(i,l,t))**(theta(i))) ;
);
PointResults('firstbest',j,'discharge',t) = w.l(j,t) ;
$ontext
AggregateResults('firstbest','xbin01',t) = sum(l$(binlag('nps01',l)), p('nps01')*A('nps01')*df('nps01')*r.l('nps01',l,t) ) ;
AggregateResults('firstbest','xbin02',t) = sum(l$(binlag('nps02',l)), p('nps02')*A('nps02')*df('nps02')*r.l('nps02',l,t) ) ;
AggregateResults('firstbest','xbin03',t) = sum(l$(binlag('nps03',l)), p('nps03')*A('nps03')*df('nps03')*r.l('nps03',l,t) ) ;
AggregateResults('firstbest','xbin04',t) = sum(l$(binlag('nps04',l)), p('nps04')*A('nps04')*df('nps04')*r.l('nps04',l,t) ) ;
AggregateResults('firstbest','xbin05',t) = sum(l$(binlag('nps05',l)), p('nps05')*A('nps05')*df('nps05')*r.l('nps05',l,t) ) ;
AggregateResults('firstbest','xbin06',t) = sum(l$(binlag('nps06',l)), p('nps06')*A('nps06')*df('nps06')*r.l('nps06',l,t) ) ;
AggregateResults('firstbest','xbin07',t) = sum(l$(binlag('nps07',l)), p('nps07')*A('nps07')*df('nps07')*r.l('nps07',l,t) ) ;
AggregateResults('firstbest','xbin08',t) = sum(l$(binlag('nps08',l)), p('nps08')*A('nps08')*df('nps08')*r.l('nps08',l,t) ) ;
AggregateResults('firstbest','xbin09',t) = sum(l$(binlag('nps09',l)), p('nps09')*A('nps09')*df('nps09')*r.l('nps09',l,t) ) ;
AggregateResults('firstbest','xbin10',t) = sum(l$(binlag('nps10',l)), p('nps10')*A('nps10')*df('nps10')*r.l('nps10',l,t) ) ;
AggregateResults('firstbest','xlag00',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l00',t) ) ;
AggregateResults('firstbest','xlag01',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l01',t) ) ;
AggregateResults('firstbest','xlag02',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l02',t) ) ;
AggregateResults('firstbest','xlag03',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l03',t) ) ;
AggregateResults('firstbest','xlag04',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l04',t) ) ;
AggregateResults('firstbest','xlag05',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l05',t) ) ;
AggregateResults('firstbest','xlag06',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l06',t) ) ;
AggregateResults('firstbest','xlag07',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l07',t) ) ;
AggregateResults('firstbest','xlag08',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l08',t) ) ;
AggregateResults('firstbest','xlag09',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l09',t) ) ;
AggregateResults('firstbest','xlag10',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l10',t) ) ;
AggregateResults('firstbest','xlag11',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l11',t) ) ;
AggregateResults('firstbest','xlag12',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l12',t) ) ;
AggregateResults('firstbest','xlag13',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l13',t) ) ;
AggregateResults('firstbest','xlag14',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l14',t) ) ;
AggregateResults('firstbest','xlag15',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l15',t) ) ;
AggregateResults('firstbest','xlag16',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l16',t) ) ;
AggregateResults('firstbest','xlag17',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l17',t) ) ;
AggregateResults('firstbest','xlag18',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l18',t) ) ;
AggregateResults('firstbest','xlag19',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l19',t) ) ;
AggregateResults('firstbest','xlag20',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l20',t) ) ;
AggregateResults('firstbest','xlag21',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l21',t) ) ;
AggregateResults('firstbest','xlag22',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l22',t) ) ;
AggregateResults('firstbest','xlag23',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l23',t) ) ;
AggregateResults('firstbest','xlag24',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l24',t) ) ;
AggregateResults('firstbest','xlag25',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l25',t) ) ;
AggregateResults('firstbest','xlag26',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l26',t) ) ;
AggregateResults('firstbest','xlag27',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l27',t) ) ;
AggregateResults('firstbest','xlag28',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l28',t) ) ;
AggregateResults('firstbest','xlag29',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l29',t) ) ;
AggregateResults('firstbest','xlag30',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l30',t) ) ;
AggregateResults('firstbest','xlag31',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l31',t) ) ;
AggregateResults('firstbest','xlag32',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l32',t) ) ;
AggregateResults('firstbest','xlag33',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l33',t) ) ;
AggregateResults('firstbest','xlag34',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l34',t) ) ;
AggregateResults('firstbest','xlag35',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l35',t) ) ;
AggregateResults('firstbest','xlag36',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l36',t) ) ;
AggregateResults('firstbest','xlag37',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l37',t) ) ;
AggregateResults('firstbest','xlag38',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l38',t) ) ;
AggregateResults('firstbest','xlag39',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l39',t) ) ;
AggregateResults('firstbest','xlag40',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l40',t) ) ;
$offtext
AggregateResults('firstbest','x',t) = sum((i,l)$(binlag(i,l)), p(i)*A(i)*df(i)*r.l(i,l,t) ) ;
AggregateResults('firstbest','w',t) = sum(j, w.l(j,t)) ;
AggregateResults('firstbest','cap',t) = sum(binlag(i,l), p(i)*A(i)*df(i)*r.l(i,l,t)/NonpointResults('firstbest',i,l,'psi',t)) + sum(j,w.l(j,t)) ;
CostResults('firstbest','abatement') = Abmtcost.l ;
CostResults('firstbest','damage') = Dmgcost.l ;
CostResults('firstbest','total') = Totcost.l ;
CostResults('firstbest','ratio') = Totcost.l/CostResults('firstbest','total') ;


Psi(i,l,t) = 10000 ;
Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = p(i)*A(i)*df(i)*(g('ps1')*exp((wbar('ps1')-w.l('ps1',t))*gtheta('ps1'))) / (c(i)*(rbar(i)-r.l(i,l,t))**(theta(i))) ;
TRScap(t) = sum((i,binlag(i,l)), p(i)*df(i)*A(i)*r.l(i,l,t)/Psi(i,l,t)) + sum(j, w.l(j,t)) ;
Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = (1+delta)**(ord(l)-1) ;
TRScap(t)$(tpsi(t)) = sum((i,binlag(i,l)), p(i)*df(i)*A(i)*r.l(i,l,'90')/Psi(i,l,'90')) + sum(j, w.l(j,'90')) ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
loop(binlag(i,l),
NonpointResults('scenario1',i,l,'discharge',t) = p(i)*A(i)*df(i)*r.l(i,l,t) ;
NonpointResults('scenario1',i,l,'delivery',t) = Load.l(i,l,t) ;
NonpointResults('scenario1',i,l,'psi',t) = 10000 ;
NonpointResults('scenario1',i,l,'psi',t)$(tpsi(t) and binlag(i,l)) = p(i)*A(i)*df(i)*(g('ps1')*exp((wbar('ps1')-w.l('ps1',t))*gtheta('ps1'))) / (c(i)*(rbar(i)-r.l(i,l,t))**(theta(i))) ;
);
PointResults('scenario1',j,'discharge',t) = w.l(j,t) ;
$ontext
AggregateResults('scenario1','xbin01',t) = sum(l$(binlag('nps01',l)), p('nps01')*A('nps01')*df('nps01')*r.l('nps01',l,t) ) ;
AggregateResults('scenario1','xbin02',t) = sum(l$(binlag('nps02',l)), p('nps02')*A('nps02')*df('nps02')*r.l('nps02',l,t) ) ;
AggregateResults('scenario1','xbin03',t) = sum(l$(binlag('nps03',l)), p('nps03')*A('nps03')*df('nps03')*r.l('nps03',l,t) ) ;
AggregateResults('scenario1','xbin04',t) = sum(l$(binlag('nps04',l)), p('nps04')*A('nps04')*df('nps04')*r.l('nps04',l,t) ) ;
AggregateResults('scenario1','xbin05',t) = sum(l$(binlag('nps05',l)), p('nps05')*A('nps05')*df('nps05')*r.l('nps05',l,t) ) ;
AggregateResults('scenario1','xbin06',t) = sum(l$(binlag('nps06',l)), p('nps06')*A('nps06')*df('nps06')*r.l('nps06',l,t) ) ;
AggregateResults('scenario1','xbin07',t) = sum(l$(binlag('nps07',l)), p('nps07')*A('nps07')*df('nps07')*r.l('nps07',l,t) ) ;
AggregateResults('scenario1','xbin08',t) = sum(l$(binlag('nps08',l)), p('nps08')*A('nps08')*df('nps08')*r.l('nps08',l,t) ) ;
AggregateResults('scenario1','xbin09',t) = sum(l$(binlag('nps09',l)), p('nps09')*A('nps09')*df('nps09')*r.l('nps09',l,t) ) ;
AggregateResults('scenario1','xbin10',t) = sum(l$(binlag('nps10',l)), p('nps10')*A('nps10')*df('nps10')*r.l('nps10',l,t) ) ;
AggregateResults('scenario1','xlag00',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l00',t) ) ;
AggregateResults('scenario1','xlag01',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l01',t) ) ;
AggregateResults('scenario1','xlag02',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l02',t) ) ;
AggregateResults('scenario1','xlag03',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l03',t) ) ;
AggregateResults('scenario1','xlag04',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l04',t) ) ;
AggregateResults('scenario1','xlag05',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l05',t) ) ;
AggregateResults('scenario1','xlag06',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l06',t) ) ;
AggregateResults('scenario1','xlag07',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l07',t) ) ;
AggregateResults('scenario1','xlag08',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l08',t) ) ;
AggregateResults('scenario1','xlag09',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l09',t) ) ;
AggregateResults('scenario1','xlag10',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l10',t) ) ;
AggregateResults('scenario1','xlag11',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l11',t) ) ;
AggregateResults('scenario1','xlag12',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l12',t) ) ;
AggregateResults('scenario1','xlag13',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l13',t) ) ;
AggregateResults('scenario1','xlag14',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l14',t) ) ;
AggregateResults('scenario1','xlag15',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l15',t) ) ;
AggregateResults('scenario1','xlag16',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l16',t) ) ;
AggregateResults('scenario1','xlag17',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l17',t) ) ;
AggregateResults('scenario1','xlag18',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l18',t) ) ;
AggregateResults('scenario1','xlag19',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l19',t) ) ;
AggregateResults('scenario1','xlag20',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l20',t) ) ;
AggregateResults('scenario1','xlag21',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l21',t) ) ;
AggregateResults('scenario1','xlag22',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l22',t) ) ;
AggregateResults('scenario1','xlag23',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l23',t) ) ;
AggregateResults('scenario1','xlag24',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l24',t) ) ;
AggregateResults('scenario1','xlag25',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l25',t) ) ;
AggregateResults('scenario1','xlag26',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l26',t) ) ;
AggregateResults('scenario1','xlag27',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l27',t) ) ;
AggregateResults('scenario1','xlag28',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l28',t) ) ;
AggregateResults('scenario1','xlag29',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l29',t) ) ;
AggregateResults('scenario1','xlag30',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l30',t) ) ;
AggregateResults('scenario1','xlag31',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l31',t) ) ;
AggregateResults('scenario1','xlag32',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l32',t) ) ;
AggregateResults('scenario1','xlag33',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l33',t) ) ;
AggregateResults('scenario1','xlag34',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l34',t) ) ;
AggregateResults('scenario1','xlag35',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l35',t) ) ;
AggregateResults('scenario1','xlag36',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l36',t) ) ;
AggregateResults('scenario1','xlag37',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l37',t) ) ;
AggregateResults('scenario1','xlag38',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l38',t) ) ;
AggregateResults('scenario1','xlag39',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l39',t) ) ;
AggregateResults('scenario1','xlag40',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l40',t) ) ;
$offtext
AggregateResults('scenario1','x',t) = sum((i,l)$(binlag(i,l)), p(i)*A(i)*df(i)*r.l(i,l,t) ) ;
AggregateResults('scenario1','w',t) = sum(j, w.l(j,t)) ;
AggregateResults('scenario1','cap',t) = sum(binlag(i,l), p(i)*A(i)*df(i)*r.l(i,l,t)/NonpointResults('scenario1',i,l,'psi',t)) + sum(j, w.l(j,t)) ;
CostResults('scenario1','abatement') = Abmtcost.l ;
CostResults('scenario1','damage') = Dmgcost.l ;
CostResults('scenario1','total') = Totcost.l ;
CostResults('scenario1','ratio') = Totcost.l/CostResults('firstbest','total') ;


Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = 1 ;
TRScap(t)$(tpsi(t)) = AggregateResults('firstbest','x','90') + AggregateResults('firstbest','w','90') ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
loop(binlag(i,l),
NonpointResults('scenario2',i,l,'discharge',t) = p(i)*A(i)*df(i)*r.l(i,l,t) ;
NonpointResults('scenario2',i,l,'delivery',t) = Load.l(i,l,t) ;
NonpointResults('scenario2',i,l,'psi',t) = 10000 ;
NonpointResults('scenario2',i,l,'psi',t)$(tpsi(t) and binlag(i,l)) = p(i)*A(i)*df(i)*(g('ps1')*exp((wbar('ps1')-w.l('ps1',t))*gtheta('ps1'))) / (c(i)*(rbar(i)-r.l(i,l,t))**(theta(i))) ;
);
PointResults('scenario2',j,'discharge',t) = w.l(j,t) ;
$ontext
AggregateResults('scenario2','xbin01',t) = sum(l$(binlag('nps01',l)), p('nps01')*A('nps01')*df('nps01')*r.l('nps01',l,t) ) ;
AggregateResults('scenario2','xbin02',t) = sum(l$(binlag('nps02',l)), p('nps02')*A('nps02')*df('nps02')*r.l('nps02',l,t) ) ;
AggregateResults('scenario2','xbin03',t) = sum(l$(binlag('nps03',l)), p('nps03')*A('nps03')*df('nps03')*r.l('nps03',l,t) ) ;
AggregateResults('scenario2','xbin04',t) = sum(l$(binlag('nps04',l)), p('nps04')*A('nps04')*df('nps04')*r.l('nps04',l,t) ) ;
AggregateResults('scenario2','xbin05',t) = sum(l$(binlag('nps05',l)), p('nps05')*A('nps05')*df('nps05')*r.l('nps05',l,t) ) ;
AggregateResults('scenario2','xbin06',t) = sum(l$(binlag('nps06',l)), p('nps06')*A('nps06')*df('nps06')*r.l('nps06',l,t) ) ;
AggregateResults('scenario2','xbin07',t) = sum(l$(binlag('nps07',l)), p('nps07')*A('nps07')*df('nps07')*r.l('nps07',l,t) ) ;
AggregateResults('scenario2','xbin08',t) = sum(l$(binlag('nps08',l)), p('nps08')*A('nps08')*df('nps08')*r.l('nps08',l,t) ) ;
AggregateResults('scenario2','xbin09',t) = sum(l$(binlag('nps09',l)), p('nps09')*A('nps09')*df('nps09')*r.l('nps09',l,t) ) ;
AggregateResults('scenario2','xbin10',t) = sum(l$(binlag('nps10',l)), p('nps10')*A('nps10')*df('nps10')*r.l('nps10',l,t) ) ;
AggregateResults('scenario2','xlag00',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l00',t) ) ;
AggregateResults('scenario2','xlag01',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l01',t) ) ;
AggregateResults('scenario2','xlag02',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l02',t) ) ;
AggregateResults('scenario2','xlag03',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l03',t) ) ;
AggregateResults('scenario2','xlag04',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l04',t) ) ;
AggregateResults('scenario2','xlag05',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l05',t) ) ;
AggregateResults('scenario2','xlag06',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l06',t) ) ;
AggregateResults('scenario2','xlag07',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l07',t) ) ;
AggregateResults('scenario2','xlag08',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l08',t) ) ;
AggregateResults('scenario2','xlag09',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l09',t) ) ;
AggregateResults('scenario2','xlag10',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l10',t) ) ;
AggregateResults('scenario2','xlag11',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l11',t) ) ;
AggregateResults('scenario2','xlag12',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l12',t) ) ;
AggregateResults('scenario2','xlag13',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l13',t) ) ;
AggregateResults('scenario2','xlag14',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l14',t) ) ;
AggregateResults('scenario2','xlag15',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l15',t) ) ;
AggregateResults('scenario2','xlag16',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l16',t) ) ;
AggregateResults('scenario2','xlag17',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l17',t) ) ;
AggregateResults('scenario2','xlag18',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l18',t) ) ;
AggregateResults('scenario2','xlag19',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l19',t) ) ;
AggregateResults('scenario2','xlag20',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l20',t) ) ;
AggregateResults('scenario2','xlag21',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l21',t) ) ;
AggregateResults('scenario2','xlag22',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l22',t) ) ;
AggregateResults('scenario2','xlag23',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l23',t) ) ;
AggregateResults('scenario2','xlag24',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l24',t) ) ;
AggregateResults('scenario2','xlag25',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l25',t) ) ;
AggregateResults('scenario2','xlag26',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l26',t) ) ;
AggregateResults('scenario2','xlag27',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l27',t) ) ;
AggregateResults('scenario2','xlag28',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l28',t) ) ;
AggregateResults('scenario2','xlag29',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l29',t) ) ;
AggregateResults('scenario2','xlag30',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l30',t) ) ;
AggregateResults('scenario2','xlag31',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l31',t) ) ;
AggregateResults('scenario2','xlag32',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l32',t) ) ;
AggregateResults('scenario2','xlag33',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l33',t) ) ;
AggregateResults('scenario2','xlag34',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l34',t) ) ;
AggregateResults('scenario2','xlag35',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l35',t) ) ;
AggregateResults('scenario2','xlag36',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l36',t) ) ;
AggregateResults('scenario2','xlag37',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l37',t) ) ;
AggregateResults('scenario2','xlag38',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l38',t) ) ;
AggregateResults('scenario2','xlag39',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l39',t) ) ;
AggregateResults('scenario2','xlag40',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l40',t) ) ;
$offtext
AggregateResults('scenario2','x',t) = sum((i,l)$(binlag(i,l)), p(i)*A(i)*df(i)*r.l(i,l,t) ) ;
AggregateResults('scenario2','w',t) = sum(j, w.l(j,t)) ;
AggregateResults('scenario2','cap',t) = sum(binlag(i,l), p(i)*A(i)*df(i)*r.l(i,l,t)/NonpointResults('scenario2',i,l,'psi',t)) + sum(j, w.l(j,t))  ;
CostResults('scenario2','abatement') = Abmtcost.l ;
CostResults('scenario2','damage') = Dmgcost.l ;
CostResults('scenario2','total') = Totcost.l ;
CostResults('scenario2','ratio') = Totcost.l/CostResults('firstbest','total') ;


Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = (1+delta)**(ord(l)-1) ;
TRScap(t)$(tpsi(t)) = AgTMDL + WasteTMDL ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
loop(binlag(i,l),
NonpointResults('scenario3',i,l,'discharge',t) = p(i)*A(i)*df(i)*r.l(i,l,t) ;
NonpointResults('scenario3',i,l,'delivery',t) = Load.l(i,l,t) ;
NonpointResults('scenario3',i,l,'psi',t) = 10000 ;
*NonpointResults('scenario3',i,l,'psi',t)$(tpsi(t) and binlag(i,l)) = p(i)*A(i)*df(i)*(g('ps1')*exp((wbar('ps1')-w.l('ps1',t))*gtheta('ps1'))) / (c(i)*(rbar(i)-r.l(i,l,t))**(theta(i))) ;
NonpointResults('scenario3',i,l,'psi',t)$(tpsi(t) and binlag(i,l)) = (1+delta)**(ord(l)-1) ;
);
PointResults('scenario3',j,'discharge',t) = w.l(j,t) ;
$ontext
AggregateResults('scenario3','xbin01',t) = sum(l$(binlag('nps01',l)), p('nps01')*A('nps01')*df('nps01')*r.l('nps01',l,t) ) ;
AggregateResults('scenario3','xbin02',t) = sum(l$(binlag('nps02',l)), p('nps02')*A('nps02')*df('nps02')*r.l('nps02',l,t) ) ;
AggregateResults('scenario3','xbin03',t) = sum(l$(binlag('nps03',l)), p('nps03')*A('nps03')*df('nps03')*r.l('nps03',l,t) ) ;
AggregateResults('scenario3','xbin04',t) = sum(l$(binlag('nps04',l)), p('nps04')*A('nps04')*df('nps04')*r.l('nps04',l,t) ) ;
AggregateResults('scenario3','xbin05',t) = sum(l$(binlag('nps05',l)), p('nps05')*A('nps05')*df('nps05')*r.l('nps05',l,t) ) ;
AggregateResults('scenario3','xbin06',t) = sum(l$(binlag('nps06',l)), p('nps06')*A('nps06')*df('nps06')*r.l('nps06',l,t) ) ;
AggregateResults('scenario3','xbin07',t) = sum(l$(binlag('nps07',l)), p('nps07')*A('nps07')*df('nps07')*r.l('nps07',l,t) ) ;
AggregateResults('scenario3','xbin08',t) = sum(l$(binlag('nps08',l)), p('nps08')*A('nps08')*df('nps08')*r.l('nps08',l,t) ) ;
AggregateResults('scenario3','xbin09',t) = sum(l$(binlag('nps09',l)), p('nps09')*A('nps09')*df('nps09')*r.l('nps09',l,t) ) ;
AggregateResults('scenario3','xbin10',t) = sum(l$(binlag('nps10',l)), p('nps10')*A('nps10')*df('nps10')*r.l('nps10',l,t) ) ;
AggregateResults('scenario3','xlag00',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l00',t) ) ;
AggregateResults('scenario3','xlag01',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l01',t) ) ;
AggregateResults('scenario3','xlag02',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l02',t) ) ;
AggregateResults('scenario3','xlag03',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l03',t) ) ;
AggregateResults('scenario3','xlag04',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l04',t) ) ;
AggregateResults('scenario3','xlag05',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l05',t) ) ;
AggregateResults('scenario3','xlag06',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l06',t) ) ;
AggregateResults('scenario3','xlag07',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l07',t) ) ;
AggregateResults('scenario3','xlag08',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l08',t) ) ;
AggregateResults('scenario3','xlag09',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l09',t) ) ;
AggregateResults('scenario3','xlag10',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l10',t) ) ;
AggregateResults('scenario3','xlag11',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l11',t) ) ;
AggregateResults('scenario3','xlag12',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l12',t) ) ;
AggregateResults('scenario3','xlag13',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l13',t) ) ;
AggregateResults('scenario3','xlag14',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l14',t) ) ;
AggregateResults('scenario3','xlag15',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l15',t) ) ;
AggregateResults('scenario3','xlag16',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l16',t) ) ;
AggregateResults('scenario3','xlag17',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l17',t) ) ;
AggregateResults('scenario3','xlag18',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l18',t) ) ;
AggregateResults('scenario3','xlag19',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l19',t) ) ;
AggregateResults('scenario3','xlag20',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l20',t) ) ;
AggregateResults('scenario3','xlag21',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l21',t) ) ;
AggregateResults('scenario3','xlag22',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l22',t) ) ;
AggregateResults('scenario3','xlag23',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l23',t) ) ;
AggregateResults('scenario3','xlag24',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l24',t) ) ;
AggregateResults('scenario3','xlag25',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l25',t) ) ;
AggregateResults('scenario3','xlag26',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l26',t) ) ;
AggregateResults('scenario3','xlag27',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l27',t) ) ;
AggregateResults('scenario3','xlag28',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l28',t) ) ;
AggregateResults('scenario3','xlag29',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l29',t) ) ;
AggregateResults('scenario3','xlag30',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l30',t) ) ;
AggregateResults('scenario3','xlag31',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l31',t) ) ;
AggregateResults('scenario3','xlag32',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l32',t) ) ;
AggregateResults('scenario3','xlag33',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l33',t) ) ;
AggregateResults('scenario3','xlag34',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l34',t) ) ;
AggregateResults('scenario3','xlag35',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l35',t) ) ;
AggregateResults('scenario3','xlag36',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l36',t) ) ;
AggregateResults('scenario3','xlag37',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l37',t) ) ;
AggregateResults('scenario3','xlag38',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l38',t) ) ;
AggregateResults('scenario3','xlag39',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l39',t) ) ;
AggregateResults('scenario3','xlag40',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l40',t) ) ;
$offtext
AggregateResults('scenario3','x',t) = sum((i,l)$(binlag(i,l)), p(i)*A(i)*df(i)*r.l(i,l,t) ) ;
AggregateResults('scenario3','w',t) = sum(j, w.l(j,t)) ;
AggregateResults('scenario3','cap',t) = sum(binlag(i,l), p(i)*A(i)*df(i)*r.l(i,l,t)/NonpointResults('scenario3',i,l,'psi',t)) + sum(j, w.l(j,t)) ;
CostResults('scenario3','abatement') = Abmtcost.l ;
CostResults('scenario3','damage') = Dmgcost.l ;
CostResults('scenario3','total') = Totcost.l ;
CostResults('scenario3','ratio') = Totcost.l/CostResults('firstbest','total') ;


Psi(i,l,t)$(tpsi(t) and binlag(i,l)) = 1 ;
TRScap(t)$(tpsi(t)) = AgTMDL + WasteTMDL ;
Solve TradeRatioEquilibrium using nlp minimizing abmt ;
loop(binlag(i,l),
NonpointResults('scenario4',i,l,'discharge',t) = p(i)*A(i)*df(i)*r.l(i,l,t) ;
NonpointResults('scenario4',i,l,'delivery',t) = Load.l(i,l,t) ;
NonpointResults('scenario4',i,l,'psi',t) = 10000 ;
NonpointResults('scenario4',i,l,'psi',t)$(tpsi(t) and binlag(i,l)) = p(i)*A(i)*df(i)*(g('ps1')*exp((wbar('ps1')-w.l('ps1',t))*gtheta('ps1'))) / (c(i)*(rbar(i)-r.l(i,l,t))**(theta(i))) ;
);
PointResults('scenario4',j,'discharge',t) = w.l(j,t) ;
$ontext
AggregateResults('scenario4','xbin01',t) = sum(l$(binlag('nps01',l)), p('nps01')*A('nps01')*df('nps01')*r.l('nps01',l,t) ) ;
AggregateResults('scenario4','xbin02',t) = sum(l$(binlag('nps02',l)), p('nps02')*A('nps02')*df('nps02')*r.l('nps02',l,t) ) ;
AggregateResults('scenario4','xbin03',t) = sum(l$(binlag('nps03',l)), p('nps03')*A('nps03')*df('nps03')*r.l('nps03',l,t) ) ;
AggregateResults('scenario4','xbin04',t) = sum(l$(binlag('nps04',l)), p('nps04')*A('nps04')*df('nps04')*r.l('nps04',l,t) ) ;
AggregateResults('scenario4','xbin05',t) = sum(l$(binlag('nps05',l)), p('nps05')*A('nps05')*df('nps05')*r.l('nps05',l,t) ) ;
AggregateResults('scenario4','xbin06',t) = sum(l$(binlag('nps06',l)), p('nps06')*A('nps06')*df('nps06')*r.l('nps06',l,t) ) ;
AggregateResults('scenario4','xbin07',t) = sum(l$(binlag('nps07',l)), p('nps07')*A('nps07')*df('nps07')*r.l('nps07',l,t) ) ;
AggregateResults('scenario4','xbin08',t) = sum(l$(binlag('nps08',l)), p('nps08')*A('nps08')*df('nps08')*r.l('nps08',l,t) ) ;
AggregateResults('scenario4','xbin09',t) = sum(l$(binlag('nps09',l)), p('nps09')*A('nps09')*df('nps09')*r.l('nps09',l,t) ) ;
AggregateResults('scenario4','xbin10',t) = sum(l$(binlag('nps10',l)), p('nps10')*A('nps10')*df('nps10')*r.l('nps10',l,t) ) ;
AggregateResults('scenario4','xlag00',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l00',t) ) ;
AggregateResults('scenario4','xlag01',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l01',t) ) ;
AggregateResults('scenario4','xlag02',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l02',t) ) ;
AggregateResults('scenario4','xlag03',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l03',t) ) ;
AggregateResults('scenario4','xlag04',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l04',t) ) ;
AggregateResults('scenario4','xlag05',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l05',t) ) ;
AggregateResults('scenario4','xlag06',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l06',t) ) ;
AggregateResults('scenario4','xlag07',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l07',t) ) ;
AggregateResults('scenario4','xlag08',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l08',t) ) ;
AggregateResults('scenario4','xlag09',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l09',t) ) ;
AggregateResults('scenario4','xlag10',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l10',t) ) ;
AggregateResults('scenario4','xlag11',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l11',t) ) ;
AggregateResults('scenario4','xlag12',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l12',t) ) ;
AggregateResults('scenario4','xlag13',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l13',t) ) ;
AggregateResults('scenario4','xlag14',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l14',t) ) ;
AggregateResults('scenario4','xlag15',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l15',t) ) ;
AggregateResults('scenario4','xlag16',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l16',t) ) ;
AggregateResults('scenario4','xlag17',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l17',t) ) ;
AggregateResults('scenario4','xlag18',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l18',t) ) ;
AggregateResults('scenario4','xlag19',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l19',t) ) ;
AggregateResults('scenario4','xlag20',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l20',t) ) ;
AggregateResults('scenario4','xlag21',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l21',t) ) ;
AggregateResults('scenario4','xlag22',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l22',t) ) ;
AggregateResults('scenario4','xlag23',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l23',t) ) ;
AggregateResults('scenario4','xlag24',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l24',t) ) ;
AggregateResults('scenario4','xlag25',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l25',t) ) ;
AggregateResults('scenario4','xlag26',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l26',t) ) ;
AggregateResults('scenario4','xlag27',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l27',t) ) ;
AggregateResults('scenario4','xlag28',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l28',t) ) ;
AggregateResults('scenario4','xlag29',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l29',t) ) ;
AggregateResults('scenario4','xlag30',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l30',t) ) ;
AggregateResults('scenario4','xlag31',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l31',t) ) ;
AggregateResults('scenario4','xlag32',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l32',t) ) ;
AggregateResults('scenario4','xlag33',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l33',t) ) ;
AggregateResults('scenario4','xlag34',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l34',t) ) ;
AggregateResults('scenario4','xlag35',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l35',t) ) ;
AggregateResults('scenario4','xlag36',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l36',t) ) ;
AggregateResults('scenario4','xlag37',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l37',t) ) ;
AggregateResults('scenario4','xlag38',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l38',t) ) ;
AggregateResults('scenario4','xlag39',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l39',t) ) ;
AggregateResults('scenario4','xlag40',t) = sum(i, p(i)*A(i)*df(i)*r.l(i,'l40',t) ) ;
$offtext
AggregateResults('scenario4','x',t) = sum((i,l)$(binlag(i,l)), p(i)*A(i)*df(i)*r.l(i,l,t) ) ;
AggregateResults('scenario4','w',t) = sum(j, w.l(j,t)) ;
AggregateResults('scenario4','cap',t) = sum(binlag(i,l), p(i)*A(i)*df(i)*r.l(i,l,t)/NonpointResults('scenario4',i,l,'psi',t)) + sum(j,w.l(j,t)) ;
CostResults('scenario4','abatement') = Abmtcost.l ;
CostResults('scenario4','damage') = Dmgcost.l ;
CostResults('scenario4','total') = Totcost.l ;
CostResults('scenario4','ratio') = Totcost.l/CostResults('firstbest','total') ;

display CostResults ;


scalar col1 column number / 1 / ;
scalar col6 column number / 6 / ;
scalar col10 column number / 10 / ;
scalar col11 column number / 11 / ;
scalar col12 column number / 12 / ;

file output01 / NonpointResultsFirstBest.dat / ;
output01.pw = 3000 ;
output01.nj = 2 ;
put output01 ;
loop((i,l,sourceparameter)$(binlag(i,l)), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop((i,l,sourceparameter)$(binlag(i,l)), put @col6 NonpointResults('firstbest',i,l,sourceparameter,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output02 / AggregateResultsFirstBest.dat / ;
output02.pw = 3000 ;
output02.nj = 2 ;
put output02 ;
loop(aggregateparameter, put @col6 aggregateparameter.tl ; col6=col6+12 )
put / ; col6=6;
loop(t, put @col1 t.tl ;
	loop(aggregateparameter, put @col6 AggregateResults('firstbest',aggregateparameter,t):10:4; col6=col6+12)
	put / ; col6=6;
) ;


$ontext
file output02 / OptimalNonpointBin02.dat / ;
output02.pw = 3000 ;
output02.nj = 2 ;
put output02 ;
loop(bin02(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin02(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin02(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin02(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin02(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin02(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output03 / OptimalNonpointBin03.dat / ;
output03.pw = 3000 ;
output03.nj = 2 ;
put output03 ;
loop(bin03(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin03(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin03(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin03(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin03(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin03(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output04 / OptimalNonpointBin04.dat / ;
output04.pw = 3000 ;
output04.nj = 2 ;
put output04 ;
loop(bin04(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin04(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin04(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin04(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin04(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin04(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output05 / OptimalNonpointBin05.dat / ;
output05.pw = 3000 ;
output05.nj = 2 ;
put output05 ;
loop(bin05(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin05(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin05(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin05(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin05(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin05(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;


file output06 / OptimalNonpointBin06.dat / ;
output06.pw = 3000 ;
output06.nj = 2 ;
put output06 ;
loop(bin06(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin06(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin06(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin06(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin06(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin06(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output07 / OptimalNonpointBin07.dat / ;
output07.pw = 3000 ;
output07.nj = 2 ;
put output07 ;
loop(bin07(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin07(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin07(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin07(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin07(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin07(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output08 / OptimalNonpointBin08.dat / ;
output08.pw = 3000 ;
output08.nj = 2 ;
put output08 ;
loop(bin08(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin08(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin08(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin08(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin08(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin08(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output09 / OptimalNonpointBin09.dat / ;
output09.pw = 3000 ;
output09.nj = 2 ;
put output09 ;
loop(bin09(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin09(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin09(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin09(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin09(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin09(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output10 / OptimalNonpointBin10.dat / ;
output10.pw = 3000 ;
output10.nj = 2 ;
put output10 ;
loop(bin10(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin10(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin10(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin10(i,l), put @col6 OptimalNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin10(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	loop(bin10(i,l), put @col6 OptimalNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output11 / OptimalDischarge.dat / ;
output11.pw = 3000 ;
output11.nj = 2 ;
put output11 ;
loop(j, put @col6 j.tl ; col6=col6+12)
put @col6 "nonpoint" ; col6=col6+12;
loop(i, put @col6 i.tl ; col6=col6+12)
put / ; col6=6;
loop(t, put @col1 t.tl ;
	loop(j, put @col6 OptimalPointDischarge(j,t):10:4; col6=col6+12)
	put @col6 OptimalNonpointDischargeSector(t):10:4; col6=col6+12;
	loop(i, put @col6 OptimalNonpointDischargeBin(i,t):10:4; col6=col6+12)
	put / ; col6=6;
) ;

file output12 / OptimalDelivery.dat / ;
output12.pw = 3000 ;
output12.nj = 2 ;
put output12 ;
loop(j, put @col6 j.tl ; col6=col6+12)
put @col6 "nonpoint" ; col6=col6+12;
loop(i, put @col6 i.tl ; col6=col6+12)
put / ; col6=6;
loop(t, put @col1 t.tl ;
	loop(j, put @col6 OptimalPointDischarge(j,t):10:4; col6=col6+12)
	put @col6 OptimalNonpointDeliverySector(t):10:4; col6=col6+12;
	loop(i, put @col6 OptimalNonpointDeliveryBin(i,t):10:4; col6=col6+12)
	put / ; col6=6;
) ;

file output13 / OptimalPolicyVariables.dat / ;
output13.pw = 3000 ;
output13.nj = 2 ;
put output13 ;
put @col6 "TRScap" ; col6=col6+12; col10=col10+12;
loop(binlag(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col12=12;
loop(t, put @col1 t.tl ;
	put @col6 OptimalTRScap(t):10:4; col6=col6+12;
	loop(binlag(i,l), put @col6 OptimalPsi(i,l,t):10:4; col6=col6+12)
	put / ; col6=6;
) ;

file output14 / Cost.dat / ;
output14.pw = 3000 ;
output14.nj = 2 ;
put output14 ;
put @col1 "AbmtCost" ; col1=col1+12;
put @col1 "DmgCost" ; col1=col1+12;
put @col1 "TotCost" ; col1=col1+12;
put / ; col1=1;
put @col1 OptimalAbatementCost:10:4 ; col1=col1+12;
put @col1 OptimalDamageCost:10:4 ; col1=col1+12;
put @col1 OptimalTotalCost:10:4 ; col1=col1+12;
put / ; col1=1;
put @col1 SecondBestAbatementCost:10:4 ; col1=col1+12;
put @col1 SecondBestDamageCost:10:4 ; col1=col1+12;
put @col1 SecondBestTotalCost:10:4 ; col1=col1+12;
put / ; col1=1;
put @col1 AbatementCostRatio:10:4 ; col1=col1+12;
put @col1 DamageCostRatio:10:4 ; col1=col1+12;
put @col1 TotalCostRatio:10:4 ; col1=col1+12;
put / ; col1=1;

file output15 / SecondBestNonpointBin01.dat / ;
output15.pw = 3000 ;
output15.nj = 2 ;
put output15 ;
loop(bin01(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin01(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin01(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin01(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin01(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin01(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output16 / SecondBestNonpointBin02.dat / ;
output16.pw = 3000 ;
output16.nj = 2 ;
put output16 ;
loop(bin02(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin02(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin02(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin02(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin02(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin02(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output17 / SecondBestNonpointBin03.dat / ;
output17.pw = 3000 ;
output17.nj = 2 ;
put output17 ;
loop(bin03(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin03(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin03(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin03(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin03(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin03(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output18 / SecondBestNonpointBin04.dat / ;
output18.pw = 3000 ;
output18.nj = 2 ;
put output18 ;
loop(bin04(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin04(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin04(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin04(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin04(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin04(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output19 / SecondBestNonpointBin05.dat / ;
output19.pw = 3000 ;
output19.nj = 2 ;
put output19 ;
loop(bin05(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin05(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin05(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin05(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin05(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin05(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output20 / SecondBestNonpointBin06.dat / ;
output20.pw = 3000 ;
output20.nj = 2 ;
put output20 ;
loop(bin06(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin06(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin06(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin06(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin06(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin06(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output21 / SecondBestNonpointBin07.dat / ;
output21.pw = 3000 ;
output21.nj = 2 ;
put output21 ;
loop(bin07(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin07(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin07(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin07(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin07(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin07(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output22 / SecondBestNonpointBin08.dat / ;
output22.pw = 3000 ;
output22.nj = 2 ;
put output22 ;
loop(bin08(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin08(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin08(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin08(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin08(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin08(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output23 / SecondBestNonpointBin09.dat / ;
output23.pw = 3000 ;
output23.nj = 2 ;
put output23 ;
loop(bin09(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin09(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin09(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin09(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin09(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin09(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output24 / SecondBestNonpointBin10.dat / ;
output24.pw = 3000 ;
output24.nj = 2 ;
put output24 ;
loop(bin10(i,l), put @col6 i.tl put @col11 "-" put @col12 l.tl; col6=col6+12; col10=col10+12; col11=col11+12; col12=col12+12)
loop(bin10(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
loop(bin10(i,l), put @col6 "DEL-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col11=11; col12=12;
loop(t, put @col1 t.tl ;
	loop(bin10(i,l), put @col6 SecondBestNonpointDischargeParcel(i,l,t):10:4; col6=col6+12)
	loop(bin10(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	loop(bin10(i,l), put @col6 SecondBestNonpointDeliveryParcel(i,l,t):10:4; col6=col6+12)
	put / ; col6=6; col10=10; col11=11; col12=12;
) ;

file output25 / SecondBestDischarge.dat / ;
output25.pw = 3000 ;
output25.nj = 2 ;
put output25 ;
loop(j, put @col6 j.tl ; col6=col6+12)
put @col6 "nonpoint" ; col6=col6+12;
loop(i, put @col6 i.tl ; col6=col6+12)
put / ; col6=6;
loop(t, put @col1 t.tl ;
	loop(j, put @col6 SecondBestPointDischarge(j,t):10:4; col6=col6+12)
	put @col6 SecondBestNonpointDischargeSector(t):10:4; col6=col6+12;
	loop(i, put @col6 SecondBestNonpointDischargeBin(i,t):10:4; col6=col6+12)
	put / ; col6=6;
) ;

file output26 / SecondBestDelivery.dat / ;
output26.pw = 3000 ;
output26.nj = 2 ;
put output26 ;
loop(j, put @col6 j.tl ; col6=col6+12)
put @col6 "nonpoint" ; col6=col6+12;
loop(i, put @col6 i.tl ; col6=col6+12)
put / ; col6=6;
loop(t, put @col1 t.tl ;
	loop(j, put @col6 SecondBestPointDischarge(j,t):10:4; col6=col6+12)
	put @col6 SecondBestNonpointDeliverySector(t):10:4; col6=col6+12;
	loop(i, put @col6 SecondBestNonpointDeliveryBin(i,t):10:4; col6=col6+12)
	put / ; col6=6;
) ;

file output27 / SecondBestPolicyVariables.dat / ;
output27.pw = 3000 ;
output27.nj = 2 ;
put output27 ;
put @col6 "TRScap" ; col6=col6+12; col10=col10+12;
loop(binlag(i,l), put @col6 "psi-" put @col10 l.tl; col6=col6+12; col10=col10+12)
put / ; col6=6; col10=10; col12=12;
loop(t, put @col1 t.tl ;
	put @col6 SecondBestTRScap(t):10:4; col6=col6+12;
	loop(binlag(i,l), put @col6 SecondBestPsi(i,l,t):10:4; col6=col6+12)
	put / ; col6=6;
) ;

$offtext


