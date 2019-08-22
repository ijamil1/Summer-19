for i = 1:size(props,1)
    nameProp = string(props(i).name);
    genotype = char(extractBetween(nameProp,5, 5));
    data = csvread(nameProp);
    plot(data(:,1));
    hold on;
    ci = dir(strcat('CI',genotype, '*.csv'));
    last2genotypes = extractBetween(nameProp, strlength(nameProp)-9 ,strlength(nameProp)-4);
    g1 = char(extractBetween(last2genotypes, 1, 3));
    g2 = char(extractBetween(last2genotypes, 4, 6));
    g1 = str2num(g1);
    g2 = str2num(g2);
    confInt = findConfInt(ci, g1, g2);
    dataCI = csvread(confInt);
    plot(dataCI(:,1));
    plot(dataCI(:,2));
    s2 = ".fig";
    nameProp = extractBetween(nameProp, 1, strlength(nameProp)-4);
    s = strcat(nameProp, s2);
    saveas(gcf, s);
    hold off;
end
