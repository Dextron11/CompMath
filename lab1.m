close all;
clear; 
pkg load symbolic ;

#input 
#-------------------------------------------------------------------------------------------------

f=inline(input('input function: ','s') );
startInterval=input('input start of interval: ');

do
  endInterval=input('input end of interval: '); 
until ((endInterval>=startInterval))

do 
  numberInterpolationNodes=input('input of number of interpolation nodes:');
until(numberInterpolationNodes>0)

do 
  errorCheckingPoint=input('input of error checking point: ');
until(errorCheckingPoint>=startInterval && errorCheckingPoint<=endInterval)

choice=input('distribution of points 1=evenly; 2=Chebyshev polynomial ');
switch choice
  case 1 
    interpolationPoints = startInterval:((abs(endInterval-startInterval))/(numberInterpolationNodes-1)):endInterval;
  case 2
    m=0:numberInterpolationNodes-1;
    interpolationPoints  =0.5*((endInterval-startInterval)*cos((2*m+1)/numberInterpolationNodes*0.5*pi)+startInterval+endInterval);
endswitch;

#------------------------------------------------------------------------------------------------
#lagrange interpolation

y = f(interpolationPoints);
diaposon=linspace(startInterval,endInterval,1000);
yy=lagrange(interpolationPoints,y,diaposon);

#------------------------------------------------------------------------------------------------
#error calculation

theoreticalError=theoreticalError(interpolationPoints,f,diaposon,errorCheckingPoint)
practicalError=abs((f(errorCheckingPoint))-lagrange(interpolationPoints,y,errorCheckingPoint))

#------------------------------------------------------------------------------------------------
#graphics

hold on;
grid on;
plot(interpolationPoints,y,'bo','color','k')
plot(diaposon,yy,'color','b')
plot(diaposon,f(diaposon),'color','r')
legend('Точки интерполяционного полинома','График интерполяционого полином','Исходная функция',-1)

#------------------------------------------------------------------------------------------------
