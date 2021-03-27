clc
clear all
close all
global llamadas
llamadas=0;
name='booth';

limitsUpper=[100 100];
limitsLower=[-100 -100];
for l=1:length(limitsUpper)
    r(l) = (limitsUpper(l)-limitsLower(l)).*rand(1,1) + limitsLower(l);
    pos(l) = r(l);
end
 %optimo = OptimizacionGradiente([10 10],name,limitsUpper,limitsLower)


%options=optimoptions('fminunc','OptimalityTolerance',1e-5,'StepTolerance',1e-5);
%x = fminunc(name,[10 10],options)

options=optimoptions('fmincon','OptimalityTolerance',1e-4,'StepTolerance',1e-4);
x = fmincon(name,[10 10],[],[],[],[],limitsLower,limitsUpper,[],options)
llamadas