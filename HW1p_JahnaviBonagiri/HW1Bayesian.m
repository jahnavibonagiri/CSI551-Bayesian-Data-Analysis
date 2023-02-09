
% 
% Created By: 
%           Jahnavi Bonagiri
%           September 20, 2022
%           Bayesian Data Analysis
%           Intstructor: Professor Kevin Knuth
% This file answers questions A, B and E

%%
%%Question A
%Tic Toc functions are used to get the elapsed time 
tic
toc
%Initialize the variables used
a=0;
s=10;
%Loop that creates the vector to 10, and increments adding the 1.0
for c=1:s
    a= a+0.10;
end
%Printing the values
fprintf("Value of A:: %d\n", a)
%Subtracts to get the error difference
a=a-1.0;
fprintf("\nAfter subtracting 1.0:: %d", a)
toc
%%
%%Question B
%Tic Toc functions used to get the elapsed time
tic
toc
%Creates the vector and sums to get the total
b(1:10)=0.10;
sum(b)
%Subtracts by 1.0 to get the error difference and prints
x=sum(b)-1.0;
fprintf("\nAfter subtracting 1.0:: %d", x)
toc

%%
%Question E
%At least one six when rolling 6 six-sided dice.
%Intializes 
N=100
%Uses randi function to randomize values
random= randi(6,6, N);
%Find the sixes
one= random==6 ;
%Sum the values
summed= sum(one);
final= summed>=1;
%Divide 
prob6= sum(final)/N;
%Print the values
fprintf('\nRandomized Prob of at least one six when rolling 6 six-sided dice. %f', prob6)
%Uses the mathematical formula with combinations
probonesix= (1-((5/6)^6));
fprintf('\nMathematical computation of at least one six when rolling 6 six-sided dice. %f', probonesix)

%%
%At least two sixes when rolling 12 six-sided dice.
%Initializes
N=100;
%Uses randi function to randomize values
random= randi(6,12,N);
%Find the sixes
one= random==6 ;
%Sum the values
summed= sum(one);
final= summed>=2;
%Divide 
prob7= sum(final)/N;
%Print the values
fprintf('\nRandomized Prob of at least two six when rolling 12 six-sided dice. %f', prob7)
probtwosix= (1-((5/6)^12))-nchoosek(12,1)*(1/6)*(5/6)^11;
fprintf('\nMathematical computation of at least one six when rolling 6 six-sided dice. %f', probtwosix)

%%
%At least three sixes when rolling 18 six-sided dice.
%Intializes 
N=100;
%Uses randi function to randomize values
random= randi(6,18, N);
%Find the sixes
one= random==6 ;
%Sum the values
summed= sum(one);
final= summed>=3;
%Divide 
prob8= sum(final)/N;
fprintf('\nRandomized Prob of at least three six when rolling 18 six-sided dice. %f', prob8)
probthreesix= (1-((5/6)^18))-nchoosek(18,1)*(1/6)*(5/6)^17-nchoosek(18,2)*(1/6)^2*(5/6)^16;
fprintf('\nMathematical computation of at least one six when rolling 6 six-sided dice. %f', probthreesix)







