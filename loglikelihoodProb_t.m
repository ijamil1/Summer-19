function result = loglikelihoodProb_t(spliceMutTimes, N, t_b, mut, f, b)
    whichMu=b;      
    prob_t = TimeDependentProbs(spliceMutTimes, N, t_b, mut, f);
    result = 0;
    for c = 1:1000
        result = result - log(prob_t(c));
    end
end