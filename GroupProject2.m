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
% scatter plot to show each value at corresponding index in the array
scatter(1:50, randData, 'filled');
title('Uniformly Distributed Random Data (rand)');
xlabel('Index');
ylabel('Value');
grid on;

% randn
figure;
% bar plot to show value at each index in array, bar allows easier visual
% comparison
bar(randnData);
title('Normally Distributed Random Data (randn)');
xlabel('Index');
ylabel('Value');
grid on

% baseball data
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
% mean() for mean, median() for median
% std() for standard deviation
% iqr for interquartile range

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
vectorizedRand = (randData - randMean)/randSTDDEV;
zscoreRand = zscore(randData);

% randn
normalizedRandnData = (randnData - mean(randnData)) / std(randnData);
zscoreRandn = zscore(randnData);

% normalized baseball data
vectorizedSox = (scores(:, 1) - soxMean)/soxSTDDEV;
zscoreSox = zscore(scores(:,1));

%% PART SIX: NORMALIZED PLOTS
% Adjusting bin sizes in histograms changes how detailed the data appears.
% Fewer bins makes more broad categories and a more smooth distribution but 
% shows less specific info. More bins add detail, showing smaller 
% variations but also showing more variability, making it harder to
% interpret from just looking at it. 


% rand
figure;
subplot(2,2,1);
hist(zscoreRand, 5);
title('5 Bins');
ylabel('Count');
xlabel('Z-Scores');

subplot(2,2,2);
hist(zscoreRand,10);
title('10 Bins')
ylabel('Count');
xlabel('Z-Scores');

subplot(2,2,3);
hist(zscoreSox,15);
title('15 Bins')
ylabel('Count');
xlabel('Z-Scores');

subplot(2,2,4);
hist(zscoreRand,20);
title('20 Bins')
ylabel('Count');
xlabel('Z-Scores');

sgtitle('Z-Score Histograms for Random Distribution')

% randn
% 2x2 subplot with histograms
figure;
subplot(2,2,1);
% small bins
histogram(normalizedRandnData, 5);
title('Histogram with 5 Bins');
xlabel('Normalized Data');
ylabel('Frequency');
grid on;

% medium bins
subplot(2,2,2);
histogram(normalizedRandnData, 10);
title('Histogram with 10 Bins');
xlabel('Normalized Data');
ylabel('Frequency');
grid on;

% bigger bin size
subplot(2,2,3);
histogram(normalizedRandnData, 20);
title('Histogram with 20 Bins');
xlabel('Normalized Data');
ylabel('Frequency');
grid on;

% giant bin size
subplot(2,2,4);
histogram(normalizedRandnData, 50);
title('Histogram with 50 Bins');
xlabel('Normalized Data');
ylabel('Frequency');
grid on;

sgtitle('Z-Score Histograms for Normal Distribution');

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

% The `rand` dataset spreads evenly across the bins, making it look flat 
% because it generates data from a uniform distribution, where all values 
% are equally likely. This means the mean and median for `rand` are similar, 
% and the z-scores are evenly distributed without any noticeable grouping.
%
% The `randn` dataset forms a bell curve, with most values near the center, 
% since it generates data from a normal distribution that has more values 
% around the mean. For `randn`, the mean and median are almost identical, 
% showing the symmetry of the normal distribution. The z-scores show 
% tight clustering near zero, showoing the high concentration of values
% near the mean. Adding more bins displays the even pattern of `rand` 
% and the bigger peak near the mean in `randn`


% To do: publish to PDF

