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
p_A = c()
p_B = c()
C = c()
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

