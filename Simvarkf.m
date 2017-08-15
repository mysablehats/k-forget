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
            simvar.excfun = @(data,ii)executioncore_in_starterscript(simvar(ii).arq_connect, data);
            
            simvar.tolerance = 0.01;
            simvar.acc = .95;
            simvar.classfun = @(x,is, isnt)knearestclass(x, is, isnt);
            
        end
    end
end