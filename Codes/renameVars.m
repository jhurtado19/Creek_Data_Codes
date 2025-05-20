function renamedArgs = renameVars(varargin)
    % Initialize cell array to store renamed arguments
    renamedArgs = cell(size(varargin));
    
    % Loop through each input argument
    for i = 1:length(varargin)
        arg = varargin{i};
        
        % Rename based on the value of the argument
        if isequal(arg, 'CDOMRFU')
            renamedArgs{i} = 'cdom';
        elseif isequal(arg, 'TryptophanRFU')
            renamedArgs{i} = 'trp';
        elseif isequal(arg, 'Temperature')
            renamedArgs{i} = 'temp';
        elseif isequal(arg, 'datetime')
            renamedArgs{i} = 'a';
        else
            renamedArgs{i} = arg; % Keep the original value if no match
        end
    end
end