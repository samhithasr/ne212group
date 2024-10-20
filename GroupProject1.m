% Group members: Sam Somavarapu, Roshan Sharma, Rabiat Gira
% Parameters
years = 5; % Number of years
seasons = {'Winter', 'Spring', 'Summer', 'Fall'}; % Season names
monthNames = {'Jan', 'Feb', 'March', 'Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
numMonths = 12;
daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

% Create a 3D array for temperatures: (months, days, years)
months = nan(numMonths, max(daysInMonth), years); 
avgTemp = zeros(years, numMonths); % To store average temperatures for each year and month

% Generate random temperatures for each month over the specified years
for year = 1:years
    for i = 1:numMonths % Iterate over each month
        % Determine min and max temperature based on the month
        if (i < 4 || i > 10) % Jan - Mar, Nov & Dec
            minTemp = 0;
            maxTemp = 45;
        elseif (i == 4 || i == 10) % Apr, Oct
            minTemp = 45;
            maxTemp = 65;
        elseif (i == 5 || i == 9) % May, Sep
            minTemp = 50;
            maxTemp = 75;
        else % June, July, August
            minTemp = 70;
            maxTemp = 95;
        end
        
        % Generate random temperature data for each day of the month
        months(i, 1:daysInMonth(i), year) = randi([minTemp, maxTemp], 1, daysInMonth(i));
    end
end

% Calculate average temperatures for each month and year
for year = 1:years
    if (year == 4)
        daysInMonth(2) = 29;
    end
    for i = 1:numMonths
        avgTemp(year, i) = mean(months(i, 1:daysInMonth(i), year), 'omitnan');
    end
end

% Display the generated data
disp(months);
disp(avgTemp);
