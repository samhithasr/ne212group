% Group members: Sam Somavarapu, Rohan Sharma, Rabiat Giram

% To do: add individual member contributions; explanations of what the
% code does; add in-depth comments; edit out the %% commenting once
% finished with code


%% PART TWO: GENERATE DATA

% first data set
randData = rand(1,50);

% second data set
randnData = randn(1,50);

% third data set
% taken from: https://www.baseball-almanac.com/teamstats/schedule.php?y=2023&t=BOS
redSox2023 = readtable("RedSox2023.csv");

% Numerical values from table
scoresWithoutWins = split(string(redSox2023{:,4}));

% Taking: scores, win/loss info. first column = 
% Sox score; 2nd = other team; 3rd = win or loss
scores = zeros(size(scoresWithoutWins, 1),3);
for i = 1:size(scores)
    scores(i, 1) = scoresWithoutWins(i, 1);
    scores(i, 2) = scoresWithoutWins(i, 2);
    if (string(redSox2023{i, 5}) == "W")
        scores(i, 3) = 1;
    else
        scores(i, 3) = 0;
    end
end

%% PART THREE: RAW DATA PLOTS
% plots here

% rand

% randn

figure;
plot(scores(:,1), 'r-');
hold on;
plot(scores(:,2), 'b-');
xlabel('Game');
ylabel('Score');
title('Red Sox 2023 Season');
xlim([0 162]);
legend('Red Sox', 'Other team');
grid on;

%% PART FOUR: MEAN, MEDIAN, STD DEV, IQR
% statistical analysis commands

% randData section
randMean = mean(randData);
randMedian = median(randData);
randSTDDEV = std(randData);
randIQR = iqr(randData);

% randnData section
randnMean = mean(randnData);
randnMedian = median(randnData);
randnSTDDEV = std(randnData);
randnIQR = iqr(randnData);

% third section
soxMean = mean(scores(:,1));
soxMedian = median(scores(:,1));
soxSTDDEV = std(scores(:,1));
soxIQR = iqr(scores(:,1));

%% PART FIVE: ZSCORE

% rand
%dataset = [0.7011, 0.6663, 0.5391, 0.6981, 0.6665, 0.1781, 0.1280, 0.9991, ...
        0.1711, 0.0326, 0.5612, 0.8819, 0.6692, 0.1904, 0.3689, 0.4607, ...
        0.9816, 0.1564, 0.8555, 0.6448, 0.3763, 0.1909, 0.4283, 0.4820, ...
        0.1206, 0.5895, 0.2262, 0.3846, 0.5830, 0.2518, 0.2904, 0.6171, ...
        0.2653, 0.8244, 0.9827, 0.7302, 0.3439, 0.5841, 0.1078, 0.9063, ...
        0.8797, 0.8178, 0.2607, 0.5944, 0.0225, 0.4253, 0.3127, 0.1615, ...
        0.1788, 0.4229];

% Calculate Z-scores using the vectorized function
zScores = zscore(data);

% Create a figure
figure;

% First subplot for the histogram of Z-scores
subplot(2, 1, 1); % 2 rows, 1 column, first subplot
hist(zScores, 'Normalization', 'pdf'); % Normalize to probability density function
xlabel('Z-score'); % Label for x-axis
ylabel('Probability Density'); % Label for y-axis
title('Histogram of Z-scores'); % Title for the first subplot
grid on; % Show grid for better visualization

% Second subplot for the histogram of the original data
subplot(2, 1, 2); % 2 rows, 1 column, second subplot
hist(data, 'Normalization', 'pdf'); % Normalize to probability density function
xlabel('Value'); % Label for x-axis
ylabel('Probability Density'); % Label for y-axis
title('Histogram of Original Data'); % Title for the second subplot
grid on; % Show grid for better visualization
% Create a histogram of Z-scores
figure; % Create a new figure
hist(zScores, 'Normalization', 'pdf'); % Normalize to probability density function





% Display the Z-scores
disp('Z-scores:');
disp(zScores);
% randn

% normalized THIRD data
vectorizedSox = (scores(:, 1) - soxMean)/soxSTDDEV;
zscoreSox = zscore(scores(:,1));

%% PART SIX: NORMALIZED PLOTS
% rand
randData = rand(1, 50); 50 random values between 0 and 1
figure; 
hist(randData, 'Normalization,' 'pdf'); %Normalize the histogram to probability density function
xlabel('Value'); %Label for x-axis
ylabel('Normalized frequency'); Label for y-axis
title('Normalized histogram of random data'); %Title for graph

% Data
categories = {'Wins', 'Losses'};
normalized_counts = [0.537, 0.463];

% Create a bar graph
figure; % Create a new figure
bar(normalized_counts);

% Customize the graph
set(gca, 'XTickLabel', categories); % Set x-axis labels
ylabel('Normalized Count'); % Label for y-axis
title('Win/Loss Record Normalized Histogram'); % Title for the graph
ylim([0 1]); % Set y-axis limits from 0 to 1 for normalization

% Show grid for better visualization
grid on;% To do: answer what changing bin sizes does to these plots, as per the
% second part of question 6.

% rand

% randn

% third
figure;
subplot(2,2,1);
hist(zscoreSox, 5);
title('5 Bins');
ylabel('Count');
xlabel('Z-Scores');

subplot(2,2,2);
hist(zscoreSox,10);
title('10 Bins')
ylabel('Count');
xlabel('Z-Scores');

subplot(2,2,3);
hist(zscoreSox,15);
title('15 Bins')
ylabel('Count');
xlabel('Z-Scores');

subplot(2,2,4);
hist(zscoreSox,20);
title('20 Bins')
ylabel('Count');
xlabel('Z-Scores');

sgtitle('Z-Score Histograms for Red Sox Scores with N Bins')

%% PART SEVEN: RAND VS RANDN
% To do: after finishing 2-6 for rand and randn, answer here in comments 
% what the key differences between rand and randn are, plus what they 
% mean in terms of the functions we called to produce the data (mean,
% median, zscore, etc.)

% To do: publish to PDF

