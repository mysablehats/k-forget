function edata = encodedata(data, encodecomplexity)
edata = [];
for i =1:length(data)
    edata = cat(2, encodefun(data(:,i),encodecomplexity),edata);
end

end
function edatai = encodefun(datai,encodecomplexity)
    %my current encoder will just concatenate the data into longer vectors.
    for i = 1:(length(datai)-encodecomplexity)        
        edatai(i) = reshape(datai(i:i+encodecomplexity,:),1,[]);        
    end
end