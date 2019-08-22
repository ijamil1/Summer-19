function R = RgeneratingMatrix(N, mu,f)

R = zeros(20);
for i = 1:20
    for j = 1:20
        if (i ~= j)
           rel_fit = f(j)/f(i);
           Q = generatorMatrix(1, N, rel_fit);
           pfixes = -inv(Q(2:N, 2:N)) * Q(2:N, N+1);
           pf = pfixes(1);
           R(i, j) = (mu(i,j)) * pf;
        end
    end
    R(i,i) = -1 * sum(R(i,:));
end
end
