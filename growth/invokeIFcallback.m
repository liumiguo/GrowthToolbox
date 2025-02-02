function [m,results] = invokeIFcallback( m, varargin )
%[m,results] = invokeIFcallback( m, callback, varargin )
%   Invoke the function called ['GFtbox_', callback, '_Callback' ], that
%   should be defined in the interaction function.
%   The function should return two results: the first is the mesh itself,
%   and the second is whatever result it needs to return (using e.g. a
%   struct to return multiple results).

    results = [];
    if ischar( m )
        varargin = [ m, varargin ];
        m = getGFtboxMesh();
    end
    if ~isempty(m)
        if isa(m.globalProps.mgen_interaction,'function_handle')
            fn = ['GFtbox_', varargin{1}, '_Callback' ];
%             try
                [m,results] = m.globalProps.mgen_interaction( m, fn, varargin{2:end} );
%             catch e
%                 fprintf( 'Could not invoke interaction function callback %s:\n%s\n', fn, e.message );
%                 results = [];
%             end
        else
            results = [];
        end
    end
end
