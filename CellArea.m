
N=length(X);
A=zeros(N,1);
for i=1:N
    z = length(C{i});
    V(C{i}(z),3)=0;
    for m=1:(z-1)
        A(i) = A(i) + 0.5*norm(cross(V(C{i}(m),:),V(C{i}(m+1),:)));
    end
    A(i) = A(i) + 0.5*norm(cross(V(C{i}(z),:), V(C{i}(1),:)));
end 

