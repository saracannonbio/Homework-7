#Cannon Homework 7

rm(list=ls())

#Problem 1

#load parameter values from spreadsheet

reps = 10000
dat = read.csv('/Users/saracannon/Documents/Quantitative Ecology/Homework 7/Stickleback SDM params.csv',header=T)

#Program parameter values into R

T = dat[1,3]
xcrit = dat[2,3]
xmax = dat[3,3]
a = dat[4,3] 
#Note: Tim made some of his parameters into arrays. Why?
E1 = dat[5,3]
E2 = dat[6,3]
E3 = dat[7,3]
E4 = dat[8,3]
E5 = dat[9,3]
E6 = dat[10,3]
E7 = dat[11,3]
tau1 = dat[12,3]
tau2 = dat[13,3]
tau3 = dat[14,3]
tau4 = dat[15,3]
tau5 = dat[16,3]
tau6 = dat[17,3]
tau7 = dat[18,3]
p_A1 = dat[19,3]
p_A2 = dat[20,3]
p_A3 = dat[21,3]
p_A4 = dat[22,3]
p_A5 = dat[23,3]
p_A6 = dat[24,3]
p_A7 = dat[25,3]
p_B1 = dat[26,3]
p_B2 = dat[27,3]
p_B3 = dat[28,3]
p_B4 = dat[29,3]
p_B5 = dat[30,3]
p_B6 = dat[31,3]
p_B7 = dat[32,3]
C1 = dat[33,3]
C2 = dat[34,3]
C3 = dat[35,3]
C4 = dat[36,3]
C5 = dat[37,3]
C6 = dat[38,3]
C7 = dat[39,3]
