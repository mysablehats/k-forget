function s = simpar
s.tolerance = 0.03;
s.acc = .95;
s.classfun = @(x,is, isnt)knearestclass(x, is, isnt);
end