function H = partialVertex(cell, vertex,X,V)
%Compute the partial derivate of a vertex with respect to a given cell 
%dh\dr
SC=SurroundingCells(X);
H=zeros(2);
p = find(cell == SC(vertex,:));
 %Find surrounding 3 cells, 'cell' should be one of them

if p==1
    j = SC(vertex,2);
    l = SC(vertex,3);
elseif p==2
    j = SC(vertex,3);
    l = SC(vertex,1);
else
    j = SC(vertex,1);
    l = SC(vertex,2);
end 

X(cell,3) = 0;
X(j,3) = 0;
X(l,3) = 0;
a= X(cell,:) - X(j,:);
b= X(j,:) - X(l,:);
c = X(cell,:) - X(l,:);

D= 2*norm(cross(a,b));
alpha = (1/D)*norm(b)*dot(a,c);
%beta = (1/D)*norm(c)*dot(-a,b);
%gamma = (1/D)*norm(a)*dot(-c,-b);
%h = alpha*V(cell,:) + beta*V(j,:) + gamma*V(l,:);

partialalpha1 = ((norm(b))/(2*(norm(cross(a,b))^2)))*(norm(cross(a,b))*(a(1) + c(1)) - 2*(a(1)-c(1))*(a(1)*norm(b)-b(1)*dot(a,b)));
partialalpha2 = ((norm(b))/(2*(norm(cross(a,b))^2)))*(norm(cross(a,b))*(a(2) + c(2)) - 2*(a(2)-c(2))*(a(2)*norm(b)-b(2)*dot(a,b)));
partialbeta1 = (1/(2*norm(cross(a,b))^2))*(norm(cross(a,b))*(2*c(1)*dot(-a,b)- b(1)*norm(c)) - 2*norm(c)*dot(-a,b)*(a(1)*norm(b)-b(1)*dot(a,b)));
partialbeta2 = (1/(2*norm(cross(a,b))^2))*(norm(cross(a,b))*(2*c(2)*dot(-a,b)- b(2)*norm(c)) - 2*norm(c)*dot(-a,b)*(a(2)*norm(b)-b(2)*dot(a,b)));
partialgamma1 = (1/(2*norm(cross(a,b))^2))*(norm(cross(a,b))*(2*a(1)*dot(-c,-b) + b(1)*norm(a)) - 2*norm(a)*dot(-c,-b)*(a(1)*norm(b)-b(1)*dot(a,b)));
partialgamma2 = (1/(2*norm(cross(a,b))^2))*(norm(cross(a,b))*(2*a(2)*dot(-c,-b) + b(2)*norm(a)) - 2*norm(a)*dot(-c,-b)*(a(2)*norm(b)-b(2)*dot(a,b)));

H(1,1) = alpha + X(cell,1)*partialalpha1 + X(j,1)*partialbeta1 + X(l,1)*partialgamma1; %dh(x)\dx
H(1,2) = X(cell,2)*partialalpha1 + X(j,2)*partialbeta1 + X(l,2)*partialgamma1; %dh(y)\dx
H(2,1) = X(cell,1)*partialalpha2 + X(j,1)*partialbeta2 + X(l,1)*partialgamma2; %dh(x)\dy
H(2,2) = alpha + X(cell,2)*partialalpha2 + X(j,2)*partialbeta2 + X(l,2)*partialgamma2; %dh(y)\dy

end 