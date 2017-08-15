function s = simpar
s = Simvarkf({'PARA' 0});
s.tolerance = 0.03;
s.acc = .95;
s.classfun = @(x,is, isnt)knearestclass(x, is, isnt);
end