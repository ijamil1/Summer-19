progress = 0;
model2muFvals = minimizeM2fVals(N, t_b, f_simulated, mu, muData, progress);
%model2muDivtenFvals = minimizeM2muDivtenFvals(N, t_b, f_simulated, muDivten, muDivtenData, progress);
%model2muDivhundFvals = minM2muDivhundFvals(N, t_b, f_simulated, muDivhund, muDivhundData, progress);



function model2muFvals = minimizeM2fVals(N, t_b, f, mu, mudata, progress)
    for i = 1:30
        [fvals, result] = fminsearch(@(f)logLikelihood3(N, mu, f, t_b, mudata{i}), ones(1,20));
        model2muFvals(i, :) = fvals;
        progress = progress + 1;
    end
end

function model2muDivtenFvals = minimizeM2muDivtenFvals(N, t_b, f, muDivten, muDivtenData, progress)
    for i = 1:30
        [fvals, result] = fminsearch(@(f)logLikelihood3(N, muDivten, f, t_b, muDivtenData{i}), ones(1,20));
        model2muDivtenFvals(i, :) = fvals;
        progress = progress + 1;
    end
end

function model2muDivhundFvals = minM2muDivhundFvals(N, t_b, f, muDivhund, muDivhundData, progress)
    for i = 1:30
        [fvals, result] = fminsearch(@(f)logLikelihood3(N, muDivhund, f, t_b, muDivhundData{i}), ones(1,20));
        model2muDivhundFvals(i, :) = fvals;
        progress = progress + 1;
    end
end

