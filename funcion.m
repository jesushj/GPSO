function valor=funcion(x)
global llamadas
llamadas = llamadas + 1;
y=x(1);
z=x(2);

valor=-(z+47)*sin((abs((y/2)+z+47))^0.5)-y*sin((abs(y-(z+47)))^0.5);


end