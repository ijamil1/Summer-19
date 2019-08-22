function simulateBirthDeath(fixed_prot, f_simulated, N, mu)
    a_acidCount(1:20) = N/20;   
    f_rels(1:20) = 0;
    for i = 1:20
        f_rels(i) = f_simulated(i);%/f_simulated(fixed_prot);
    end
run = 1;
end_state = a_acidCount;
time = 0;
counter(1:20) = 0;
while (time <= 1000000)
    [end_state,time, counter] = simulateBirthDeaths(end_state, fixed_prot, 100, f_rels, time, mu, counter);
    run = run + 1;
end
c_sum = sum(counter);
for d = 1:20
    counter(d) = counter(d)/c_sum;
end
counter
function [end_state,time, counter] = simulateBirthDeaths(end_state, fixed_prot, N, f_rels, time, mu, counter)
    burn_time = 100000;
    weighted_pop = 0;
    for j = 1:20
        weighted_pop = weighted_pop + (end_state(j) * f_rels(j));
    end
    comparator = rand;
    prob_vector(1:400) = 0;
    
 
    for x = 1:20
        for y = 1:20 
            if x~=y
                prob_vector(20*(x-1)+y) = (end_state(x)*f_rels(x)/weighted_pop) * (end_state(y)/N) + (end_state(y)*mu(y,x));
            else
                prob_vector(20*(x-1)+y) = 0;
            end
        end
    end
    rate = sum(prob_vector);
    prev = time;
    time = time + exprnd(1/rate);
    if (time >= burn_time)
    for c = 1:20
        counter(c) = counter(c) + (time-prev)*end_state(c);
    end
    end
    for a = 1:400
        prob_vector(a) = prob_vector(a)/rate;
    end
        
    prob_sum = 0; 
    index = 0;
    while ((prob_sum < comparator) && (index <= 399))
        index = index + 1;
        prob_sum = prob_sum + prob_vector(index);
    end
    % index indicates what the birth/death combination is
    death = mod(index,20);
    if (death == 0)
        death = 20;
        birth = index/20;
    else
    birth = floor(index/20) + 1;
    end
    
    
    end_state(birth) = end_state(birth) + 1;
    end_state(death) = end_state(death) - 1;
end
end
