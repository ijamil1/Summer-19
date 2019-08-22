function result = logLikelihood(Psubstitution, data)
    [rows, cols] = size(Psubstitution);
    result = 0;
    for i = 1:rows
        for j = 1:cols
            result = result - (data(i,j)*log(Psubstitution(i,j)));
        end
    end
end