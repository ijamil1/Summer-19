Mutationtimes = cell(3,30,1000);
for a = 1:3
    for b = 1:30
        for c = 1:1000
            Mutationtimes{a,b,c} = zeros(3,4);
            Mutationtimes{a,b,c}(1,:) = allFixations_andFinalSample{a,b,c}(1,:);
            dataset = allFixations_andFinalSample{a,b,c};
            [rows, cols] = size(dataset);
            Mutationtimes{a,b,c}(2,:) = allFixations_andFinalSample{a,b,c}(rows,:);
            for d = 1:4
                if (dataset(1,d) ~= dataset(rows,d))
                    %mutation occured and fixed
                    t = 0;
                    traverser = rows - 1;
                    while ((traverser >=1) && (dataset(traverser,d) == dataset(rows,d)))
                       t = t + 1;
                       traverser = traverser -1;
                    end
                    Mutationtimes{a,b,c}(3,d) = t;
                
                else
                    Mutationtimes{a,b,c}(3,d) = -1;
                end     
            end
        end
    end
end

