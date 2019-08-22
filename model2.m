function Psub2 = model2(N,f,mu, t_b)
R = RgeneratingMatrix(N, mu, f);
for i = 1:20
    for j = 1:20
        if i ~= j
            Psub2(i,j) = R(i,j)*(1-exp(R(i,i)*t_b))/(-R(i,i));
        else
            Psub2(i,j) = exp(R(i,i)*t_b);
        end
    end
end
end