function cell = WhichCellDivides(r)
n=length(r);
R=Periodicity3(r); %Update periodic boxes
[V,C] = voronoin(R); %Re-tesselate 
[A,P] = CellPolyareaPerimeter(V,C);%Calculate area and perimeter
averageArea = mean(A(1:n,:));
AreaDeviation=zeros(n,1);

 for i=1:n
    AreaDeviation(i) = A(i) - averageArea;
 end
 
 cell = find(AreaDeviation == max(AreaDeviation));
 
end 