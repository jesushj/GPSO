clear; clc; close all;

lim = [-600, 600; -600, 600; -600, 600; -600, 600];
N = 100;
it = 1000;
errmax = 1e-50000000;
opt = 0;
name = 'griewank';
alpha = 1.5;
beta = 2.5;
acc = 1;
[Fmin, G, it_tot, err] = PSO_grad(name,lim,N,it,acc,alpha,beta,opt,errmax);