function E = CellEnergy(r,A,P)
n=length(r);
E=[];
Ka=0.1;
Kp=0.1;
A0=mean(A(1:n,:)); %Preferred area
P0=mean(P(1:n,:));%Preferred perimeter 

for i=1:n
    E(i) = Ka*(A(i)-A0)^2 + Kp*(P(i)-P0)^2 ;
end 


end