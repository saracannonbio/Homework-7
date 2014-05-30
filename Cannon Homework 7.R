#Cannon Homework 7

rm(list=ls())

#Problem 1

#load parameter values from spreadsheet

reps = 10000
dat = read.csv('/Users/saracannon/Documents/Quantitative Ecology/Homework 7/Stickleback SDM params.csv',header=T)

#Program parameter values

T = 360
xmax = 450
xcrit = 1
a = 1
E = c(10, 20, 40, 80, 130, 180, 260)
tau = c(1, 1, 2, 4, 10, 27, 70)
p_A = c(0.0475,0.0775,0.11,0.0775,0.0625,0.09,0.0125)
p_B = c(0.03,0.07,0.02,0.02,0.0225,0.075,0.0083)
C = c(1,0.98,0.9,0.58,0.33,0.2,0.12)
nprey = length(C);
sizes = c(3:9);

#Terminal fitness functions, linear and non-linear
x = (1:xmax)
TFF = (1/xmax)*(x)  #linear fitness function

#Create figure to show shape of TFF
plot(TFF, type='l', xlab=('Energy reserves (x) at time t = T'), ylab=('Fitness at time t = T'))

#solve SDPE using backwards iteration for times t<T

#Initiate matrices to store results

F = array(0,dim=c(xmax,T));
D = array(0,dim=c(xmax,T));

#Create for-loops and if loops

if EX = 1, p = p_A;
elseif EX = 2, p = p_B

for t = (T-1):-1:1{
for x = xcrit+1:xmax
f_no_prey = F(max(xcrit,x-a),t+1);
for i = 1:nprey
f_ignore = f_no_prey;
f_attack = C(i) * F(max(xcrit,min(xmax,x-a*tau(i)+E(i))),min(T,t+tau(i)))+(1-C(i))*f_no_prey;
if f_attack>=f_ignore
f(i)=p(i)*f_attack;
D(x,t,i) = 1;
else
  f(i) = p(i)*f_ignore;
D(x,t,i) = 0;

F(x,t) = (1-sum(p))*f_no_prey+sum(f);

if EX == 1
F_A = F;
D_A = D;
elseif EX == 2
FB = F;
D_B = D

