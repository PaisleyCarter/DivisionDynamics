function [r,theta] = CellDeath(r,theta)

T=TestingDivisionCriteria(r);
a = find(T.AreaDeviation == min(T.AreaDeviation));
p = find(T.PerimeterDeviation == min(T.PerimeterDeviation));
e = find(T.EnergyDeviation == max(T.EnergyDeviation));

if a == p & a == e
    r(a,:)=[];
    theta(a) = [];
end 

    