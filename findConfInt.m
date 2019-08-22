 function confInt = findConfInt(ci,g1, g2)  
    confInt = "idk";
    for i = 1:size(ci,1)
        nameOrig = string(ci(i).name);
        name = extractBetween(nameOrig, 1, strlength(nameOrig)-11);
        if (strcmp((char(extractBetween(name, strlength(name), strlength(name)))),'.') == 1)
            last2f = extractBetween(name, strlength(name)-4, strlength(name));
            a1 = str2num(char(extractBetween(last2f, 1,2)));
            a2 = str2num(char(extractBetween(last2f, 4,5)));
        else
            last2f = extractBetween(name, strlength(name)-6, strlength(name));
            a1 = str2num(char(extractBetween(last2f, 1,3)));
            a2 = str2num(char(extractBetween(last2f, 5,7)));
        end
        if (sum([a1, a2] == [g1,g2]) == 2)
            confInt=nameOrig;
            break;
        end
        
    end
end