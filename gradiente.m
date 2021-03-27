function valor = gradiente(vars,name)
% vars: vector of the value at the point for gradient [x,y,z...]
% name: name of the function to be analize
s=0.001; %h, step for numerical differentiation 
for k=1:length(vars)  
    h=zeros(1,length(vars));
    h(k)=s;
    der(k)= (feval(name,vars+h)-feval(name,vars-h))/(2*s);          % Centered differencing

end
valor=der; %gradient



end