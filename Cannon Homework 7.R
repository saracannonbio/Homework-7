#Cannon Homework 7

rm(list=ls())

#Problem 1

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
EX=c(1:2)

#Terminal fitness functions, linear and non-linear
x = (1:xmax)
TFF = (1/xmax)*(x)  #linear fitness function

#Create figure to show shape of TFF
plot(TFF,type='l',main='Terminal Fitness Function',xlab='Energy reserves (x) at time t = T',ylab='Fitness at time t = T')

#solve SDPE using backwards iteration for times t<T

#Initiate matrices to store results

F = array(0,dim=c(xmax,T));
D = array(0,dim=c(xmax,T));

#Tell R to differentiate between experiment 1 and experiment 2 

if (EX[1]) {
  p=p_A
}
if (EX[2]) {
  p=p_B
}


for (t in seq((T-1),1,-1)) {
  for (x in seq(xcrit+1:xmax){
    if_no_prey = F(max(xcrit,x-a),t+1);
  }
  for (i in 1:nprey){
    f_ignore = f_no_prey;
    f_attack = C(i) * F(max(xcrit,min(xmax,x-a*tau(i)+E(i))),min(T,t+tau(i)))+(1-C(i))*f_no_prey;
}
if (f_attack>=f_ignore) {
f(i)=p(i)*f_attack;
D(x,t,i) = 1;
else
  f(i) = p(i)*f_ignore;
D(x,t,i) = 0;
}

F(x,t) = (1-sum(p))*f_no_prey+sum(f);

if (EX[1]) {
F_A = F;
D_A = D;
} else (EX[2]) {
FB = F;
D_B = D
}



#Answers should show:
#For size class 1, always attack/eat the prey
#Size classes 3 and 4, almost always attack (except when there are blue)
#Size class 5 and 6, full gut contents correspond with when you should ignore 
#mostly approaching the terminal time
#For size class 7, should ignore over half of the time.



#Problem 2

#Run for Monte Carlo simulations

reps = 1000
Prop_died = [0,0]
Decis = zeros(nprey,2) #decisions the fish make
Endstate = zeros (reps,2)
MC_fish_x={}

for EX = 1:2 {
  AF = array()) #attack frequency, should be 7 rows and 2 columns of 0's
  MC_fish = array(0,dim=c(reps,T)) #make a matrix of 0s
MC_fish(:,1) = 50;
for r = 1:reps {
  if EX == 1
  D = D_A;
  p = p_A;
  else
    D = D_B
  p = p_B;
}
    #for random prey encounters, create vector of expected prey encounters
p_enc = [p 1-sum(p)];
E_pr = cumsum(p_enc);
t=1;
while t<T {
  x = round(MC_fish(r,t));
  #if i <=7, prey type i is encountered
  #if i = 8, no prey are encountered in that time step
  rval = rand();
  i = sum(rval>=E_pr)+1;
  if i<=7
  d = D(x,t,i);
  if d == 1
  AF(i,1) = AF(i,1)+1;
  rval2=rand();
  if rval2<C(i)
  for tt = 1:tau(i)
  t = t+1
  if t<=T
  MC_fish(r,t) = min(xmax,MC_fish(r,t-1) - A + E(i)/tau(i));
}
}
else {
  t = t+1;
MC_fish(r,t) = x-a;
}
else {
  AF(i,2) = AF(i,2)+1;
  t = t+1
  MC_fish(r,t) = x-a
}
else {
  t = t+1
  MC_fish(r,t) = x-A;
}
t = min(t,T);
if {
  MC_fish(r,t) <=xcrit
MC_fish(r,t) = 0
Deaths = Deaths+1
t = T
elseif {
  MC_fish(r,t) > xmax
  MC_fish(r,t) = xmax;
}
}
Endstate(r,EX) = round(MC_fish(r,T));
}
prop_died(EX) = Deaths/reps;
Decis(:,EX) = AF(:,1)/AF(:,1)+AF(:,2));
MC_fish_x{EX} = MC_fish;
}

bar(sizes,Decis)
xlim([2.5,9.5])
xlab = 'Prey size (mm)'
ylab = 'Frequency of attack'
legend = 'Experiment A: high prey density','Experiment B: low prey density'
