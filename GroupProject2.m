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

% randn

% normalized THIRD data
vectorizedSox = (scores(:, 1) - soxMean)/soxSTDDEV;
zscoreSox = zscore(scores(:,1));

%% PART SIX: NORMALIZED PLOTS
% To do: answer what changing bin sizes does to these plots, as per the
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

