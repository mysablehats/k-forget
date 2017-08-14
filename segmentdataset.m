function [is,isnt] = segmentdataset(data,label)
is = [];
isnt = [];
for i = 1:length(data)
    if isequal(data(i).label,label)
        is = cat(1,is,data(i));
    else
        isnt = cat(1,isnt,data(i));
    end
end
end