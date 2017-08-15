function outs = classkforget(s, datavar)
%s = simpar;
outs = [];
for i = 1:size(datavar.train.y ,1)
    [isl,isntl] = segmentdataset(datavar.train,i);
    is = splitdataset(isl);
    isnt = splitdataset(isntl);
    [encodercomplexity, memis] = kforget(is, isnt, s);
    
end
end