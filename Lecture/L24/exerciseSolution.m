clear all
close all
clc

%% Question 1:

% measured striation data
plunge = 45; % [deg]
trend  = 230; % [deg]

% measured strike of plane
strike = 190; % [deg]

%% Part 1: Determine the dip direction of the plane

% The striation lies on the plane so the dip of the plane is directly
% related to the plunge of the striation.

gamma = 90 - plunge;
dip = asind( cosd(gamma) );

%% Part 2: Calculate the rake of the striation relative to the strike
% express the rake as the angle clockwise from the right-hand rule strike

% Remember: rake represents the angle between the linear feature and a
% line defining the strike of the plane

% Uvec is the strike line vector --> [Un, Ue, Ud]
% Vvec is the linear line vector --> [Vn, Ve, Vd]

% Do a test -- rake should be 30 deg
trend = 320;
plunge = 22;
strike = 300;

% Another test -- rake should be 123 deg
trend = 182.1;
plunge = 30.3;
strike = 53;

% use strike and dip of plane to make Uvec --> actually use line equation
% with plunge0 and trend=strike
% Uvec = [ sind(strike)*sind(dip), -cosd(strike)*sind(dip), cosd(dip) ];
Uvec = [ cosd(0)*cosd(strike), cosd(0)*sind(strike), sind(0)];

% use plunge and trend of striation to make Vvec
Vvec = [ cosd(plunge)*cosd(trend), cosd(plunge)*sind(trend), sind(plunge)];

rake = acosd( dot(Uvec,Vvec) / norm(Uvec) / norm(Vvec) );


%% Find actual strike and dip from 2 apparent strike,dip measurements

% line 1;
t1 = 209; % trend 1
p1 = 22; % plunge 1
% line 2
t2 = 56; % trend 2
p2 = 37; % plunge 2

U1vec = [ cosd(p1)*cosd(t1), cosd(p1)*sind(t1), sind(p1)];
U2vec = [ cosd(p2)*cosd(t2), cosd(p2)*sind(t2), sind(p2)];

U3vec = cross( U1vec, U2vec ); % do cross product and check that D-comp is down
if U3vec(3) < 0 % switch the direction
    U3vec = cross( U2vec, U1vec );
end

% Make sure we have a unit vector
U3vec = U3vec ./ norm( U3vec );

% split the components so we can see what is happening matches our eqns
N = U3vec(1);
E = U3vec(2);
D = U3vec(3);

% Determine trend and plunge of the pole to the plane
plunge = asind( D );
if N >=0
    trend = atand( E / N );
else
    trend = atand( E / N ) + 180;
end

% Compute the strike and dip
strike = trend +  90; % [deg]
dip = 90 - plunge;

%% Question 2:

% You want to depict the fault plane on a geologic map and therefore need
% to know its dip, but you forgot to measure it in the field.  Using the
% information from question 1, determine the dip of the fault plane.


%% Question 3: 

% At a different outcrop, two joint faces show the trace of bedding, but at
% no place on the outcrop can you measure the strike and dip of bedding
% directly.  Given the orientation of the joint faces and corresponding
% apparent dips of the bedding plane as shown in the diagram below,
% calculate the true strike and dip of bedding.





