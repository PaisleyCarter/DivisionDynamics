function SC = SurroundingCells(X)
%For each vertex, find the 3 cells surrounding it and display in 'SC'
N=length(X);
[V,C] = voronoin(X);
SC = zeros(length(V)-1,4);

for i=2:length(V)
    count3 = 1;
    for j=1:N
        M= ismember(i, C{j});
        if M==1
            SC(i-1,count3) = j;
            count3 = count3 + 1;
        else 
            continue
        end
    end
end

SC = vertcat(zeros(1,4), SC);
end 