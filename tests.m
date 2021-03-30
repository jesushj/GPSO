clear; clc;
global llamadas
llamadas = 0;
N = 10;
it = 7;
errmax = 1e-50000000;
opt = 0;%-1.0316 camel
name = 'funcion2';  %griewank
alpha = 2;
beta = 2;
acc = 1;
errgrad=0;
llamadasgrad=0;
errpso=0;
llamadaspso=0;
% Cada fila es una variable, col1 limite inf, col 2 lim sup
lim = [-50, 50; -50, 50];
for i=1:10
llamadas=0;
[Fmin, G, it, err] = PSO(name,lim,N,it,acc,alpha,beta,opt,errmax);
errpso=[errpso err];
llamadaspso=[llamadaspso llamadas];

llamadas=0;

[Fmin, G, it, err] = PSO_grad(name,lim,N,it,acc,alpha,beta,opt,errmax);
errgrad=[errgrad err];
llamadasgrad=[llamadasgrad llamadas];

end
figure(1)
plot(llamadasgrad,errgrad,'*')
figure(2)
plot(llamadaspso,errpso,'o')
mean(llamadasgrad)
mean(llamadaspso)
mean(errgrad)
mean(errpso)