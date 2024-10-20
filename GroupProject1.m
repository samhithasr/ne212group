% Group members: Sam Somavarapu, Rohan Sharma, Rabiat Giram
% This script generates random temperature data for 5 years, calculates monthly averages, and plots graphs.

% Parameters
years = 5; % Number of years
monthNames = {'Jan', 'Feb', 'March', 'Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'}; % Month names
numMonths = 12; % Number of months in a year
daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; % Number of days in each month

% Create a 3D array for storing temperatures for each month, day, and year
months = nan(numMonths, max(daysInMonth), years); 
avgTemp = zeros(years, numMonths); % Array to store average temperatures for each month and year

% Generate random temperatures for each month over the specified years
for year = 1:years
    for i = 1:numMonths % Iterate over each month
        % Determine min and max temperature based on the month (seasonal variability)
        if (i < 4 || i > 10) % Jan - Mar, Nov & Dec (Winter months)
            minTemp = 0;
            maxTemp = 45;
        elseif (i == 4 || i == 10) % Apr, Oct (Spring/Fall transition)
            minTemp = 45;
            maxTemp = 65;
        elseif (i == 5 || i == 9) % May, Sep (Mild Spring/Fall)
            minTemp = 50;
            maxTemp = 75;
        else % June, July, August (Summer months)
            minTemp = 70;
            maxTemp = 95;
        end
        
        % Generate random temperature data for each day of the month
        % 'randi' generates random integers between minTemp and maxTemp
        % Result is stored in the 'months' array for each day of the current month
        months(i, 1:daysInMonth(i), year) = randi([minTemp, maxTemp], 1, daysInMonth(i));
    end
end

%% Calculate average temperatures for each month and year
for year = 1:years
    if (year == 4)
        daysInMonth(2) = 29; % Adjust for leap year (29 days in February)
    end
    for i = 1:numMonths
        % Calculate the average temperature for the current month
        % 'mean' computes the mean temperature across all days in the current month
        % 'omitnan' option ensures that missing (NaN) values are ignored in the calculation
        avgTemp(year, i) = mean(months(i, 1:daysInMonth(i), year), 'omitnan');
    end
end

%% Display the generated data
disp(months); % Display temperature data for all months
disp(avgTemp); % Display average temperatures for each month and year

%% Plot Figure 1: Histogram for Temperature Ranges
figure;
% Histogram for the temperature distribution, showing how frequently different temperature ranges occur
histogram(months(:), 'BinEdges', 0:5:100, 'EdgeColor', 'black');
title('Temperature Distribution Over 5 Years'); % Title of the histogram
xlabel('Temperature (°F)'); % X-axis label
ylabel('Temperature Frequency'); % Y-axis label
grid on; % Add grid for better readability

%% Plot Figure 2: Line Graph for Average Temperatures
figure;
hold on;
for year = 1:years
    % Plot the average temperature for each month, for each year
    % '-o' specifies a solid line with circular markers
    plot(1:numMonths, avgTemp(year, :), '-o', 'DisplayName', ['Year ' num2str(year)]);
end
title('Average Monthly Temperatures Over 5 Years'); % Title of the line graph
xlabel('Month'); % X-axis label
xticks(1:numMonths); % Set ticks for months
xticklabels(monthNames); % Label months on the X-axis
ylabel('Average Temperature (°F)'); % Y-axis label
legend('show'); % Show legend for different years
grid on; % Add grid for better readability
