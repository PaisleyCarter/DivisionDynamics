function [p,energy] = OptimalDivisionAngle(cell,r)

n=length(r);
originalr= r; %Save original system of cell centres r
delta=0.1; %Distance between original centre and 2 new cell centres

R=Periodicity3(r);
[V,C]=voronoin(R);
[A,P]=CellPolyareaPerimeter(V,C);
A0 = mean(A(1:n,:));
%For the cells which are above the threshold for division, remove their old
%centre and replace with 2 new cell centres 
L=linspace(0,pi,250);
TE=[];
for j=1:250
    r= originalr;
    phi= L(j);
    r(cell,1) = r(cell,1) + delta*cos(phi);    
    r(cell,2) = r(cell,2) + delta*sin(phi);
    NewCellx = originalr(cell,1) - delta*cos(phi);
    NewCelly = originalr(cell,2) - delta*sin(phi);
    r= vertcat(r,[NewCellx NewCelly]);
    TE(j) =TotalEnergy(r);
end 
origE= TotalEnergy(originalr);

%figure
%plot(L/pi,TE);
%hline = refline([0 origE]);
%hline.Color = 'r';


f= find(TE== min(TE));
p = L(f);
energy = TE(f);

end
