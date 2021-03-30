function [Fmin, G, it_tot, err] = PSO_grad(name,lim,N,it,acc,alpha,beta,opt,errmax)
options=optimoptions('fmincon','OptimalityTolerance',1e-4,'StepTolerance',1e-4,'MaxFunctionEvaluations',7);


% Cada fila es una variable, col1 limite inf, col 2 lim sup

[D,~] = size(lim);
X = zeros(D,N);
F = zeros(1,N);
Fnew = zeros(1,N);
V = zeros(D,N);

for i = 1:N
    
    for j = 1:D
        X(j,i) = rand(1)*(lim(j,2)-lim(j,1))+lim(j,1);
    end
    F(i) = feval(name,X(:,i));
    
end

[~, index] = min(F);
G = X(:,index);
P = X;

%L = OptimizacionGradiente(G',name,lim(:,2)',lim(:,1)');  
%Fmin = feval(name,L);

[L,Fmin]=fmincon(name,G',[],[],[],[],lim(:,1),lim(:,2),[],options);
%[L,Fmin]=fminunc(name,G',options);

X(:,index) = L';
G = L';

Fplot = Fmin;

err = abs(Fmin-opt);

i = 0;
while i < it
    
    i = i+1;
    for j = 1:N
        
        V(:,j) = acc*V(:,j) + alpha*rand(size(X(:,j))).*(G-X(:,j)) + beta*rand(size(X(:,j))).*(P(:,j)-X(:,j));
        X(:,j) = X(:,j) + V(:,j);
        range = true;
        for k = 1:D
            range = X(k,j) < lim(k,2) && X(k,j) > lim(k,1);
            range = range && range;
        end
        
        if range
            Fnew(j) = feval(name,X(:,j));
            %Fnew(j) = funcion([X(1,j),X(2,j)]);
        else
            Fnew(j) = 20000000000;
        end
        
        if Fnew(j) < F(j)
            P(:,j) = X(:,j);
        end
        
    end
    
    if min(Fnew) < Fmin
        [Fmin, index] = min(Fnew);
        G = X(:,index);
        if mod(i,5) == 0
            %L = OptimizacionGradiente(G',name,lim(:,2),lim(:,1));
            %Fmin = feval(name,L);
            [L,Fmin]=fmincon(name,G',[],[],[],[],lim(:,1),lim(:,2),[],options);
            %[L,Fmin]=fminunc(name,G',options);
            G = L';
            X(:,index) = L';
        end
        err = abs(Fmin-opt);
        if err < errmax
            break
        end
    end
    F = Fnew;
    Fplot = [Fplot Fmin];
    plot(Fplot);
    drawnow
    disp(Fmin);
    
end
it_tot = i;
end