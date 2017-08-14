function [encodercomplexity, memis] = kforget(is, isnt, s)
encodercomplexity = 0;
realacc = 0;
while(realacc< accuracy)
    %% increase complexity of the encoding - specialization step
    encodercomplexity = encodercomplexity + 1;
    %% encode is and isnt
    memis = encodedata(is, encodercomplexity);
    memisnt = encodedata(isnt, encodercomplexity);
    
    %%calculate starting accuracy for the current complexity encoder
    realacc = testacc(memis,memisnt,s.classfun);
    
    %% forgetting - generalization step
    % remove as much data from is as needed to reach desired accuracy with as
    % little data as possible
    accvect = nan(memis,1);
    while(1)        
        for i = 1:length(memis)
            memisp = memis;
            memisp(i) = []; % removes element
            accvect(i) = testacc(memisp,memisnt,s.classfun);
        end
        [realaccm, maxind] = max(accvect); %%%this is the index that was removed that had the least impact on overall accuracy. let's remove it
        if realaccm>accuracy+s.tolerance %%maybe I already passed the threshold
            memis(maxind) = [];
        else
            break
        end
    end
end
end
function realacc = testacc(memis,memisnt,classfun)
y1 = classifyit(memis, memisnt ,classfun); %y1 should be all ones
y2 = classifyit(memisnt, memis ,classfun); %y2 should be all zeros

realacc = (sum(y1) + sum(1 - y2))/(length(memis) + length(memisnt));
end
function y = classifyit(memis, memisnt ,classfun)
lmemis = length(memis);
y = nan(lmemis,1);
for i = 1:lmemis
    y(i) = classfun(memis(i),memis,memisnt); % y is 1 is belongs to memis, 0 if belongs to memisn't
end
end
