function [R,V,C,A,P] = UpdateTesselate(r,count)
R=Periodicity3(r);
[V,C]= voronoin(R);
[A,P] = CellPolyareaPerimeter(V,C);
plotsystem(r,R,count);
end 