function E = TotalEnergy(r)
%Calculating the total energy of the system with R cell centres
R=Periodicity3(r);
n=length(r);
[V,C]=voronoin(R);
[A,P]=CellPolyareaPerimeter(V,C);

%Initialise variables
E=0;
Ka=0.1;
Kp=0.1;
A0 = mean(A(1:n,:));
P0 = mean(P(1:n,:));

for i=1:n
    E = E + Ka*(A(i)-A0)^2 + Kp*(P(i)-P0)^2 ;
end 

end 


