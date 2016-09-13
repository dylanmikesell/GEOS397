clear all
close all






%% Problem 1: Variables and Time
%
%
% A) Create a variable 'time' using the 'clock' function
time = clock;
%
%
%
% What is the size of 'time'? 
% The size of this array is a 1x6 matrix.
%
%
% Is it a row or column vector?
% It is a row vector.
%
%
% What does time contain?
% By using the 'help' function, we see that the clock function displays the
% [year month day hour minute second] and seconds is accurate to several
% digits beyond the decimal point.
%
%
% What variable class is 'time'?
% 'time' is a double type.
%
%
% B) Create a variable called 'yearString' using the 'datestr' function
% displaying only the year.
yearString = datestr(now,'yyyy');
%
%
% C) Saved 'yearString' and 'time' as a .mat file called
% 'Time_yearString.mat'
%
%
%% Problem 2: Plotting sine and cosine waves
%
% A) Create a vector called 'tArray' using the function 'linspace'
tArray = linspace(0, 1, 1001); % contains 1001 elements with equal spacing between 0 and 1
delta = tArray(2) - tArray(1);
%
%
% What is the sample interval (in seconds) of 'tArray'?
% By using the 'delta' function, I determined the interval to be 0.001
% seconds. This function is essentially subracting the first term in the
% array from the second term. 
%
%
% B) Create a variable 'f' and set it equal to 5 Hz.
f = 5;
%
%
% C) How do you convert 'f' to angular fequency? Do this and call the new
% variabe 'w'.
% By multiplying 'f' by 2pi, it will result in an angular frequency.
w = f*2*pi;
%
%
% D) Compute the cosine and sine of of w*tArray and assign each of these to
% a variable.
cosine = cos(tArray*w);
sine = sin(tArray*w);
%
%
% E) Plot the two curves as a function of 'tArray'.
x = tArray;
y1 = cosine;
y2 = sine;
plot (x, y1, 'r-', x, y2, 'b--');
%
%
xlabel ('Time (sec)'); %added labels to axes
ylabel ('Radians');
%
%
legend ('cosine (w*tArray)', 'sine (w*tArray)', 'Location', 'northeastoutside'); %Use 'legend' to add a legend outside of the plot window in the upper
% right corner of the figure
%
%
axis( [0 1 -1.5 1.5] ); % Use 'axis' to set the x and y limits
title ('Sine and Cosine vs. Time') % Add title to plot
%
% 
grid ON % Use 'grid' to turn on a background grid in the plot
%
%
% Discuss observations of graph:
% It appears everything was properly graphed. To verify, I observed what
% the cosine of tArray(1)*2pi*5 and it resulted in 1, which is observed
% on the graph. Also, I observed what the sine of tArray(1)*2pi*5 and it
% was 0, which is what is showed on the graph of the sine function. Also,
% these two functions are very similar. They both have the same wavelength
% and amplitude. However, the sine function is shifted to the right on the
% plot.
%
%
% What is the amplitude of the wave?
% The amplitude of these waves is 1 rad, which is clear from the figure.
%
%
% How could you change the amplitude of the wave?
% You can change the amplitude of the wave my multiplying it by a number.
% For example, if it was 0.5*cos(tArray*w), the amplitude would then be 0.5
% rads.

%% Problem 3: Population Growth
%
%
% A) Create a variable called 'initialRabbits', create a time interval 'dt'
initialRabbits = 2;
dt = 1;
%
%
% B) Create a variable for the maximum gestation units and growth rate
maxGestation = 7;
b = 0.8;
%
%
% C) Use a 'while' loop to run the model through all gestation periods.
timevector = [1:7]
rabbitvector = zeros(7,1)
while dt <= 7
    totalRabbits = initialRabbits + (initialRabbits * b * dt)
    initialRabbits = totalRabbits;
    rabbitvector(dt) = totalRabbits
    dt = dt+1
end
%
% D)Create a subplot for the two graphs. 
subplot (1, 2, 1)
plot(1:7, rabbitvector)
xlabel ('Gestation Period'); %added labels to axes
ylabel ('Number of Rabbits');
ax = gca;
ax.YTickLabel = ax.YTick;
axis( [0 8 0  26000] )
title ('Population of Rabbits over 7 gestation periods') % Add title to plot
grid ON
%
%
subplot (1, 2, 2)
plot(1:7, log10(rabbitvector))
xlabel ('Gestation Period'); %added labels to axes
ylabel ('log(Number of Rabbits)');
axis( [0 8 0 5] )
title ('Log(Population of Rabbits over 7 gestation periods)') % Add title to plot
grid ON
%
%
% D) Vary the growth rate 'b'.
%b = 0.4
%   When the growth rate equals 0.4, the population at the end of 7
%   gestation periods is 1117.4 rabbits instead of 25582.7 rabbits at 0.8
%
%
%b = 0.99
%   When the growth rate equal 0.99, the population at the end of 7
%   gestation periods is 76475.3 rabbits instead of 25582.7 rabbits at 0.8
%
%
% F) Gestation length of rabbits and number of rabbits in a population
% after a full year.
% The average gestation length of rabbits is 31 days.
% Source: http://www.bio.miami.edu/hare/surpriselitter.html
% Based on this, there would be roughly 12 gestation periods in the year.
% If there are 12 gestation periods in the year and a population beginning
% with 2 rabbits grows at a rate of 1, there will be roughly 12,454,041,600
% rabbits at the end of 1 year.