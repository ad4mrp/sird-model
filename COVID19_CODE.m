% in order for the program to work, you must download a GnU extension file for Octave in order to be able to load the MS Excel file using the xlsread function.
% download: https://www.youtube.com/watch?v=ILhVbr5bEV0

clear;
clc;

pkg load io

covY = xlsread('COVID19_DATA.xlsx','COVID19_PSBB_Y');
covN = xlsread('COVID19_DATA.xlsx','COVID19_PSBB_N');
fprintf('Over the past several months, Covid-19 has negatively affected the lives of a vast number of people. People have lost their jobs and loved ones because of this infectious disease. Countries around the world have implemented strict health protocols such as social distancing to limit the number of Covid-19 cases. Some people, however, still choose to disobey these protocols despite the proven benefits of it. \n')
fprintf('  \n');
fprintf('So, we have decided to create a program to display the population trend due to Covid-19 in Indonesia. This program would also portray how health protocols are effective at lowering the peak number of Covid-19 cases. \n')
fprintf('  \n');

mau='Y';
n=size(covY,1);
X=[1:1:n];
while mau=='Y'
  fprintf('\n');
    K=input('Is social distancing being implemented? (Y/N) ','s');
    if K=='Y'
        plot(X,covY(:,2),'linewidth', 5,X,covY(:,3),'linewidth', 5,X,covY(:,4),'linewidth', 5,X,covY(:,5), 'linewidth', 5)
        legend('Susceptible','Infected','Removed','Death')
        title('Covid-19 with Social Distancing');
        xlabel('Number of Days Passed');
        ylabel('Population in Indonesia');
        grid on
        
        day=input('Input number of days after first infection: ');
        typedata=input('Input population data type: (infected(i)/recovered(r)/death(d)) : ','s');
        
        if typedata=='i'
            value=floor(covY(day,3));
            fprintf('the number of people infected is %d \n',value);
        elseif typedata=='r'
            value=floor(covY(day,4));
            fprintf('the number of people recovered is %d \n',value);
        elseif typedata=='d'
            value=floor(covY(day,5));
            fprintf('the number of death is %d \n',value);
        end
        value1=floor(covY(day,3));
        value2=floor(covY(day,4));
        value3=floor(covY(day,5));
        C=[value1 value2 value3];
        bar(C, 'r');
        xticklabels( { 'infected', 'recovered', 'death'} );
        xlabel('Data Type');
        ylabel('Population');
        title('Covid-19 with Social Distancing');
        
    elseif K=='N'
        plot(X,covN(:,2),'linewidth', 5,X,covN(:,3),'linewidth', 5,X,covN(:,4),'linewidth', 5,X,covN(:,5),'linewidth', 5)
        legend('Susceptible','Infected','Removed','Death')
        title('Covid-19 without Social Distancing');
        xlabel('Number of Days Passed');
        ylabel('Population in Indonesia');
        grid on
        
        day=input('Input number of days after first infection: ');
        typedata=input('Input population data type: (infected(i)/recovered(r)/death(d)) : ','s');
        
        if typedata=='i'
            value=floor(covN(day,3));
            fprintf('the number of people infected is %d \n',value);
        elseif typedata=='r'
            value=floor(covN(day,4));
            fprintf('the number of people who is %d \n',value);
        elseif typedata=='d'
            value=floor(covN(day,5));
            fprintf('the number of death is %d \n',value);
        end
        
        value1=floor(covN(day,3));
        value2=floor(covN(day,4));
        value3=floor(covN(day,5));
        C=[value1 value2 value3];
        bar(C, 'r');
        xticklabels( { 'infected', 'recovered', 'death'});
        xlabel('Data Type');
        ylabel('Population');
        title('Covid-19 without Social Distancing');
            
    end
        
    mau=input('Would you like to try again? (Y/N)','s');
end