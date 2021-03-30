clear; clc; close all;

lim = [-600, 600; -600, 600; -600, 600; -600, 600];
N = 40;
it = 2000;
errmax = 1e-50000000;
opt = 0;
name = 'griewank';
alpha = 2;
beta = 2;
acc = 1;
[Fmin, G, it_tot, err] = PSO(name,lim,N,it,acc,alpha,beta,opt,errmax);