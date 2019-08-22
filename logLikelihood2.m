function result = logLikelihood2(N, f, mu, t_b, data)
    newF(1:20) = 0;
    for y = 1:20
        w = 1/21;
        newF(y) = w*f(y);
        for z = 1:20
            newF(y) = newF(y) + (w*f(y)*f(z));
        end
    end
    R = RgeneratingMatrix(N,mu,newF);
    Psubstitution = expm(R*t_b);
    [rows, cols] = size(Psubstitution);
    result = 0;
    for i = 1:rows
        for j = 1:cols
            result = result - (data(i,j)*log(Psubstitution(i,j)));
        end
    end
end