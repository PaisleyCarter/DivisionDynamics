function CommonVert = CommonVertices(X, nn)
%  For each cell i, what vertices does it have in common with neighbouring cell j~= i
%Every cell will have only 2 vertices in common i.e the edge that
%separates them

N=length(X);
[V,C] = voronoin(X);
DT = delaunayTriangulation(X);
CommonVert = zeros(N,N,2);
for i=1:N
    for k=1:length(nn(i,:))
        K=nn(i,k);
         if K~= 0 
             I= intersect(C{K}, C{i});
             CommonVert(i,K,1) = I(1);
             CommonVert(i,K,2) = I(2);
         else 
             continue
         end
    end 
end 