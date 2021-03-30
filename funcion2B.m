function valor=funcion2(x)
global llamadas
llamadas = llamadas + 1;

y=x.spacevar;
z=x.spacevar2;

%y=x(1);
%z=x(2);
valor=(y+2*z-7)^2+(2*y+z-5)^2;
end