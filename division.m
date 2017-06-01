function [r, cell] = division(r)
N=length(r);
R=Periodicity3(r); %Update periodic boxes
[V,C] = voronoin(R); %Re-tesselate 
[A,P] = CellPolyareaPerimeter(V,C);%Calculate area and perimeter

cell = WhichCellDivides(r); %Decide which cell should divide 
%disp(cell)
delta=0.1; %Distance between original centre and 2 new cell centres
originalr= r; 
A0 = mean(A(1:N,:)); %Preferred area is the mean one of the system of cells
phi = OptimalDivisionAngle(cell,r); %Choose the optimal angle at which the cell should divide

r(cell,1) = r(cell,1) + delta*cos(phi);    %Update exisiting cell centre
r(cell,2) = r(cell,2) + delta*sin(phi); 
NewCellx = originalr(cell,1) - delta*cos(phi); %Create a new cell centre
NewCelly = originalr(cell,2) - delta*sin(phi);
r= vertcat(r,[NewCellx NewCelly]); %Create the new list of cell centres after division

end 