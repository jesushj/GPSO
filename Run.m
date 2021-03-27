clc
clear all
close all
name='booth';
limitsUpper=[100 100];
limitsLower=[-100 -100];
for l=1:length(limitsUpper)
    r(l) = (limitsUpper(l)-limitsLower(l)).*rand(1,1) + limitsLower(l);
    pos(l) = r(l);
end
optimo = OptimizacionGradiente(pos,name,limitsUpper,limitsLower)