for i = 1:84
    name = string(confInts(i).name);
    s2 = "fig";
    data = csvread(name);
    plot(data(:,1));
    hold on;
    plot(data(:,2));
    saveas(gcf, strcat(extractBetween(name, 1, strlength(name)-3),s2));
    hold off;
end
