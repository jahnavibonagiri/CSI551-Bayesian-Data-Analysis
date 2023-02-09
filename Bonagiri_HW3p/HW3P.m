% 
% Created By: 
%           Jahnavi Bonagiri
%           October 11, 2022
%           Bayesian Data Analysis
%           Intstructor: Professor Kevin Knuth
% This file answers questions 1,2,3,4 and 5
%% Question 1
%Initialize
a=0;
b=1;
%Use rand function
y= (b-a)*rand(1,1000)+a;
%Plot histogram
histogram(y)
%%
%%Question 2
%Initialize min and max
a=0.3;
b=0.5;
%Use rand function to generate
x= (b-a)*rand(1,100)+a;
%Plot the histogram
histogram(x)

%% Question 3
%Initialize mean and SD
m = 0;
sd = 1;
%Use randn
r = sd.*randn(1000,1) + m;
%Plot histogram
histogram(r)


%% Question 4
g = @(x, m,s) (1/sqrt(2*pi*s^2)).*exp(-1*(((x-m).^2)./(2*s^2)));
%Initialize the variables
me = 0;                             
sigma = 1;
%Generating the values
x = me + sigma*randn(1,1000);  
%Use subplot function to plot the graph on the left side
subplot(2,2,1)
%Plot histogram
h = histogram(x);
title("Gaussian Distribution")
%Initialize 
bw = h.BinWidth;
%To plot the curve
d = (max(x)-min(x))/100;
x1 = linspace(min(x), max(x),100);
p = g(x1, me, sigma);
scalefactor = sum(h.Values*bw)/(trapz(p)*d);
p = scalefactor*p;
hold on
%plotting the gaussian curve over the histogram 
plot(x1,p)
%Generating the normal distribution
h= me+sigma*randn(1000,1);
%Plots on the right side 
subplot(2,2,2)
%plot the normal histogram
l= histogram(h);
title('Normal Distribution')
hold off

%%
%%Question 5
% Assigning elements to x
x=-10:0.01:10; 
%Iterate the elements of x
for i=1:length(x)
    y(i)=piecewise(x(i));
end

% Plot x,y and establish the axis range
subplot(2,2,1)
plot(x,y)
xlim([0 4])
ylim([0 4])
%Label
xlabel('X-axis')
ylabel('Y-axis')
rectangle('Position', [0,0,4,4], 'EdgeColor', 'b', 'LineWidth', 2)
title('Piecewise Function with Rectangle')
grid on
hold on
myrand = @(r, varargin)rand(varargin{:}) * diff(r) + min(r);
%Establish range
xrange = [0 4];
yrange = [0 4];
x=4*rand(1000,1);
y=4*rand(1000,1);
%Plot x,y with the dots
plot(x,y,'.');
%Used to color differentiate the dots
color= zeros(size(y));
s=1;
for i=1:1000
    if y(i)>piecewise(x(i))
        color(i)= 1;
    else
        color(i)=0;
        b(s)=x(i);
        s=s+1;
    end
end
%Use scatter to assign blue and red colors
scatter(x(color==1), y(color==1), 'red', 'filled');
scatter(x(color==0), y(color==0), 'b', 'filled');
hold off
%Subplot to have only the blue dots to demonstrate the blue staircase
subplot(2,2,2)
x= scatter(x(color==0), y(color==0), 'b', 'filled');
histogram(b, 4)
title("Histogram of Blue Values")

%To create blue histogram
x1=1;
x2=1;
x3=1;
x4=1;
for i=length(b)
    if b(i)<1
        x1=x1+1;
    elseif b(i)<2 && b(i)>1
        x2= x2+1;
    elseif b(i)<3 && b(i>2)
         x3= x3+1;
    else
        x4= x4+1;
    end
end

% piecewise function
% Creates a piecewise function using if-else statments
% Usage:
%           function y =  piecewise(x)
%           
% Where:
%           Uses if-else statments to estbalish the boundaries
% Created By: 
%           Jahnavi Bonagiri
%           October 10th, 2022
% Piecewise function to plot the staircase
function y= piecewise(x)
%Uses the function bounds to detemine the result value
    if x >0 && x<1
        y = 1;
    elseif x>1 && x < 2
        y = 2;
    elseif x>2 && x<3
        y= 3;
    elseif x>3 && x<4
        y= 4;
    else 
        y=0;
    end
end
