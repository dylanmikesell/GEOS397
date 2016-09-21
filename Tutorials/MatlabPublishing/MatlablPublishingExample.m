% Author: Dylan Mikesell
% Created: 20 September 2016
% Last modified: 21 September 2016

%% clear workspace variables

clear all;
close all;

%% Make a vector and plot

x = linspace(0,2*pi,180/pi);
y = sin(x);

h = figure;
plot(x,y,'k');

%% Create math in MATLAB publishing
%
% This is called inline math with a single dollar sign ($) around the math.
%
% $y = \sin(x)$
% 
% This is called display math with two dollar signs ($$) around the math.
%
% $$y = \sin(x)$$
% 


