b = 1;
%fitsMu = minMu(Mutationtimes, N, t_b, mu, f_simulated, b);
fitsMudivTen = minMudivten(Mutationtimes, N, t_b, mu./10, f_simulated, b + 1);
fitsMudivHund = minMudivhund(Mutationtimes, N, t_b, mu./100, f_simulated,b + 2);



function fitsMu = minMu(Mutationtimes, N, t_b, mut, f, var)
for a = 1:30
    spliceMutTimes = Mutationtimes(var,a,:);
    [fit_optMu, val]=fminsearch(@(f)loglikelihoodProb_t(spliceMutTimes, N, t_b, mut, f, var), ones(1,20));
    fitsMu(a, :) = fit_optMu;
end
end

function fitsMudivTen = minMudivten(Mutationtimes, N, t_b, mut, f, var)
    for a = 1:30
      spliceMutTimes = Mutationtimes(var, a, :);
     [fit_optMu, val]=fminsearch(@(f)loglikelihoodProb_t(spliceMutTimes, N, t_b, mut, f,var), ones(1,20));
    fitsMudivTen(a, :) = fit_optMu;
    end
end

function fitsMudivHund = minMudivhund(Mutationtimes, N, t_b, mut, f, var)
    for a = 1:30
      spliceMutTimes = Mutationtimes(var,a,:);
     [fit_optMu, val]=fminsearch(@(f)loglikelihoodProb_t(spliceMutTimes, N, t_b, mut, f, var), ones(1,20));
    fitsMudivHund(a, :) = fit_optMu;
    end
end