function [is,isnt] = segmentdataset(data,label)
datas = pssvot(data);
is = datas(label);
datas(label) = [];
%%% now I need to make the remaining structure back into a single thing
isnt = struct; %datas(1);
fieldsl = fields(datas);
for j = 1:length(fieldsl)
    for i = 1:length(datas)
        if isfield(isnt,fieldsl{j})
            isnt.(fieldsl{j}) = cat(2, isnt.(fieldsl{j}), datas(i).(fieldsl{j}));
        else
            isnt.(fieldsl{j}) = datas(i).(fieldsl{j});
        end
    end
end
%% now changing the y since it is only 2 groups?
isnt.y = zeros(1,size(isnt.y,2));
is.y = ones(1,size(is.y,2));
%% could also remove gas field?
is = rmfield(is, 'gas');
isnt = rmfield(isnt, 'gas');
end