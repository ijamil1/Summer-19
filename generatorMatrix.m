
function Q = generatorMatrix(r, N, f)
f = abs(f);
% intially matrix is N x N matrix of zeros
Q = zeros(N+1);

for j = 2:(N+1)
    if (j~= (N+1))
        Q(j,j-1) = decOne(j, f, r, N);
    end
    if (j ~= (N+1))
        Q(j, j+1) = incOne(j, f, r, N);
    end
    vec = Q(j, 1:N+1);
    Q(j, j) = sum(vec) * -1;
end

function p = incOne(i, f, r, N)
    cur = i-1;
    weighted_population = (f*cur) + (N-cur);
   
    p = r*((f*cur)/weighted_population)*((N-cur)/N);
end

function p = decOne(i, f, r, N)
    cur = i-1;
    weighted_population = (f*cur) + (N-cur);
    p = r*((N-cur)/weighted_population)*(cur/N);
end
end



