function optimo = OptimizacionGradiente(pos,name,limitsUpper,limitsLower)
MaxIter=1000;
Tol=1e-2;
step=1;  %initial step
k=1;    %Iter counter
error=10; %Initial error
while (error>Tol)&&(k<MaxIter)
        
     grad(1,:)=gradiente(pos(1,:),name);
     pos(2,:) = pos(1,:)-step*grad(1,:);
     for i=1:length(pos(1,:))
         if pos(2,i)>limitsUpper(i)
             pos(2,i) = limitsUpper(i);
         elseif pos(2,i)<limitsLower(i)
             pos(2,i) = limitsLower(i);
         end
     end
     grad(2,:)=gradiente(pos(2,:),name);
     transpuesta=transpose(pos(2,:)-pos(1,:));
     restagrad=grad(2,:)-grad(1,:);
     step=abs(dot(transpuesta,restagrad))/norm(restagrad)^2;
     error=norm(pos(2,:)-pos(1,:));
     pos(1,:)=pos(2,:);
     k=k+1;
    
end
    
optimo=pos(1,:);

end