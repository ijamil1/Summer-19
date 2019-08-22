for i = 1:size(results,1)
    name = results(i).name;
    str = string(name)
    s2 = "fig";
    data = csvread(str);
    plot(data(:,1));
    saveas(gcf, strcat(extractBetween(str, 1, strlength(str)-3),s2));
end