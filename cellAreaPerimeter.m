function [A, P] = cellAreaPerimeter(V,C)
%Calculating the cell area and perimeter of cells in a voronoi tesselation
%with cell centers C and vertices V

%Initialise
n=length(C);
A=zeros(n,1);
P=zeros(n,1);

for i=1:n
    z = length(C{i});
    V(:,3)=0;%Put into 3 dimensions to use the cross product
    for m=1:(z-1)
        D=V(C{i}(m),:);
        E=V(C{i}(m+1),:);
        P(i) = P(i) + norm(D - E); %Calculating the perimeter of cell i 
        A(i) = A(i) + 0.5*norm(cross(D,E)); 
    end 
    P(i) = P(i) + norm(V(C{i}(z),:)-V(C{i}(1),:));
    A(i) = A(i) + 0.5*norm(cross(V(C{i}(z),:), V(C{i}(1),:))); %Calculating cell area
end 
