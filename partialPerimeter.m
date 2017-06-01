function [x,y] = partialPerimeter(cell,vertex, V, C)
%This function calculates dP(j)/dh(mu) where j is the cell index, mu is
%the cartesian coordinate index and h is one of the 2 vertices in common
%with cell i.

%Find position of vertex in list of cell vertices 
p = find(C{cell}==vertex);
l=length(C{cell});
if p==1
    vertexR = p+1;
    vertexL = l;
elseif p==l
    vertexR = 1;
    vertexL = p-1;
else 
    vertexR = p+1;
    vertexL = p-1;
end 
R=C{cell}(vertexR);
L=C{cell}(vertexL);
P=C{cell}(p);
    
x = ((V(P,1)- V(R,1))/norm(V(P,:) - V(R,:))) - ((V(L,1) - V(P,1))/norm(V(L,:)- V(P,:))); %dP/dh(x)
y = ((V(P,2)- V(R,2))/norm(V(P,:) - V(R,:))) - ((V(L,2) - V(P,2))/norm(V(L,:)- V(P,:))); %dP/dh(y)

end 