function adjusted_times = adjust_times(durations)
    % Initialize an array to store adjusted times
    adjusted_times = durations;
    
    for i = 1:length(durations)
        % Check if the time is between 00:00:00 and 00:59:59
        if durations(i) < hours(1)
            % Move the time back by another hour
            adjusted_times(i) = durations(i) + hours(22);
        end
    end
end


% Example usage
%times = [
 %   '00:26:00', '23:36:00', '23:26:00', '23:26:00', '23:26:00', '23:36:00',
  %  '23:06:00', '23:06:00', '22:46:00', '22:56:00', '23:16:00', '23:56:00',
   % '00:16:00', '00:36:00', '22:26:00', '23:46:00', '01:36:00', '00:26:00',
    %'22:46:00', '23:06:00', '23:36:00', '23:36:00', '23:16:00', '23:16:00',
    %'23:36:00', '23:36:00', '22:16:00', '21:46:00'
%];

%adjusted_times = adjust_times(times);
%disp(adjusted_times);
