clear; clc;
global llamadas
llamadas = 0;
N = 20;
it = 100;
alpha = 1.5;
beta = 2.5;
acc = 0.01;
name = 'levy';
errmax = 1e-3;
opt = 0;

% Cada fila es una variable, col1 limite inf, col 2 lim sup
lim = [-10, 10; -10, 10];

[Fmin, G, it, err] = PSO_grad(name,lim,N,it,opt,errmax);
Fmin
G
it
err
llamadas