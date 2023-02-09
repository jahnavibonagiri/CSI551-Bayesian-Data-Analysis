
% 
% Created By: 
%           Jahnavi Bonagiri
%           September 20, 2022
%           Bayesian Data Analysis
%           Intstructor: Professor Kevin Knuth
% This file answers questions C and D
%

%%
%Question C and D integrated
% myCOSINE function
% Creates the Cos function using the Taylor Series 
% Usage:
%           function y = myCOSINE(x)
%           
% Where:
%           Uses the Taylor Series
%           y= 1 - ((xx.^2)/factorial(2)) + ((xx.^4)/factorial(4)) - ((xx.^6)/factorial(6))+((xx.^8)/factorial(8))-((xx.^10)/factorial(10))+((xx.^12)/factorial(12))-((xx.^14)/factorial(14));
% Additonal Notes:
%           Uses different cases to map the x values
% Created By: 
%           Jahnavi Bonagiri
%           September 20th, 2022

%Declaring the function
function y = myCOSINE(x)
%Create some x values to plot the function
x = -pi:0.01:2*pi;     
% Abs function to compute the absolute value
x = rem(abs(x),2*pi);
m=x;
% Use vector
m(2, :)= ones(1, length(x));

%Declaring four cases to deal with different mappings
case1= find(((m(1, :) >= 0) & (m(1, :) <= pi/2)));
case2 = find((m(1, :) > pi/2) & (m(1, :) <= pi));
case3 = find((m(1, :) > pi) & (m(1, :) <= (1.5)*pi));
case4 = find((m(1, :) > 1.5*pi)  & (m(1, :) <= 2*pi));
% Case 1
if case1
    m(1, case1)= m(1, case1);
    m(2, case1) = 1;
    
end

% Case 2
if case2 
    m(1, case2) = pi - m(1, case2);
    m(2, case2) = -1;
   
end

% Case 3
if case3
    m(1, case3) = m(1, case3) - pi;
    m(2, case3) = -1;
  
end

% Case 4
if case4
    m(1, case4) = 2*pi - m(1, case4);
    m(2, case4) = 1;
end
    % Computing The Taylor series
    xx= m(1, :);
    y= 1 - ((xx.^2)/factorial(2)) + ((xx.^4)/factorial(4)) - ((xx.^6)/factorial(6))+((xx.^8)/factorial(8))-((xx.^10)/factorial(10))+((xx.^12)/factorial(12))-((xx.^14)/factorial(14));
    y= y.* m(2, :);
   
  %Question D 
  % Figure to draw on
  figure;
  % Plotting the function I created in black
  plot(x,y, 'b')
  hold on %hold the image so it doesn't erase the old images
  %Plotting the matlab cosine function
  plot(x, cos(x), 'r')
  hold off
  %Plotting the difference between the two graphs
figure;
    plot(x, (cos(x)-y), 'g')
 
end
