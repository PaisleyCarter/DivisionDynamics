function T = TestingDivisionCriteria(r)

n=length(r);
[R,V,C] = ComputeVoronoiPBC(r);
[A,P] = CellPolyareaPerimeter(V,C);
E = CellEnergy(r,A,P);

averageArea = mean(A(1:n,:));
averagePerimeter = mean(P(1:n,:));
averageEnergy = mean(E);

AreaDeviation=zeros(n,1);
PerimeterDeviation=zeros(n,1);
EnergyDeviation=zeros(n,1);
CellNumber=zeros(n,1);
EnergyBeforeDivision = TotalEnergy(r);
EnergyChange = zeros(n,1);

for i=1:n
    AreaDeviation(i) = A(i) - averageArea;
    PerimeterDeviation(i) = P(i) - averagePerimeter;
    CellNumber(i) = i;
    EnergyDeviation(i) = E(i) - averageEnergy;
    [phi, minimisedEnergy] = OptimalDivisionAngle(i,r);
    EnergyChange(i) = minimisedEnergy - EnergyBeforeDivision;
end 

T= table(CellNumber, AreaDeviation, PerimeterDeviation , EnergyDeviation, EnergyChange);

end