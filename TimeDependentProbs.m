function Prob_t = TimeDependentProbs(spliceMutTimes, N, t_b, mut, f)
Prob_t(1:1000) = 0;
        for c = 1:1000
            index = 1;
            fixationTimes(index) = spliceMutTimes{c}(3,1);
            index = index + 1;
            for d = 2:4
                lia =  ismember((spliceMutTimes{c}(3,d)),fixationTimes);
                % determines the distinct times at which amino acids
                % mutated to its final state
                 if (sum(lia)==0)
                     fixationTimes(index) = spliceMutTimes{c}(3,d);
                     index = index + 1;
                end
            end
             uniqueFixes = index - 1;
             new_tb = t_b / uniqueFixes;
             product = 1;
             for e = 1:4
                 negsum = -sum(mut(spliceMutTimes{c}(1,e), :));
                 if (spliceMutTimes{c}(3,e) == -1)
                     % site did not mutate and fix
                     product = product * (exp(negsum*t_b));
                 else
                     % mutation and fixation
                     orig_prot = spliceMutTimes{c}(1,e);
                     new_prot = spliceMutTimes{c}(2,e);
                     rel_fit = f(new_prot)/f(orig_prot);
                     Q = generatorMatrix(1, N, rel_fit);
                     pfixes = -inv(Q(2:N, 2:N)) * Q(2:N, N+1);
                     pf = pfixes(1);
                     product = product * -(1-exp(negsum* new_tb)) * (mut(orig_prot, new_prot)/negsum) * pf;
                 end
             end
             Prob_t(c) = product;
        end
    end

