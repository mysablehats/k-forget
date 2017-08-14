function classkforget(datavar)
s = simpar;
for i = 1:length(datavar.labels)
    [is,isnt] = segmentdataset(datavar.validation?,datavar.labels{i});
    [encodercomplexity, memis] = kforget(is, isnt, s);
    
end
end