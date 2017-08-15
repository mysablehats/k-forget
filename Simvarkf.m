classdef Simvarkf < Simvar
    properties
        tolerance
        acc
        classfun
    end
    methods
        function simvar = Simvarkf(varargin)
            %% Object Initialization %%
            % Call superclass constructor before accessing object
            % You cannot conditionalize this statement
            simvar = simvar@Simvar(varargin{:});
            
            %% Post initialization
            simvar.method = 'kforget';

            
            simvar.tolerance = 0.01;
            simvar.acc = .95;
            simvar.classfun = @(x,is, isnt)knearestclass(x, is, isnt);
            
            %%% This needs to be the last statement after everything is
            %%% done...
            simvar.excfun = @(data,ii)classkforget(simvar(ii), data);
        end
    end
end