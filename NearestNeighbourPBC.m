function nn = NearestNeighbourPBC(N,C)

nn=zeros(N-1);
for i=1:N
    count = 1;
    for j=1:length(C)
        if j ~= i  
            M= intersect(C{i}, C{j});
            L= length(M);
            if L>1
                nn(i,count) = j;
                count = count + 1;
            end
        else 
            continue
        end
    
    end
end
end 