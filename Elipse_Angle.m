%%
X_e= 1;%Elipse center coordinate
Y_e= 3;
Y_o=1;%Original coordinate
X_o=3;
a_1=1; %elipse minor past
b_1=.5; %elipse major past
syms X Y
F1=(a_1^2*(Y_o-Y)*(Y-Y_e))+(b_1^2*(X_o-X)*(X-X_e))==0;
F2=((Y-Y_e)^2/(b_1^2))+((X-X_e)^2/(a_1^2))==1;

sol = solve([F1, F2], [X, Y]); % Solver may increase computation time, may solve it algebrically in future.
Point1 = double(sol.X)
Point2 = double(sol.Y)
Px1=Point1(1,1);
Py1=Point2(1,1);
Px2=Point1(2,1);
Py2=Point2(2,1);

%% Plot the results!
    th = 0:pi/50:2*pi;%for loop for creating circle
    CB = 1;
            xunit = (a_1 ) * cos(th) + X_e;%equation of circle :D
            yunit = (b_1 ) * sin(th) + Y_e;
            ploti = plot(xunit, yunit,'g');% Ellipse
    hold on        
    plot(X_o,Y_o,'- *b','MarkerSize', 18,'LineWidth' , 2.5)  
    plot(Point1(1,1),Point2(1,1),'- xr','MarkerSize', 18,'LineWidth' , 2.5) 
    plot(Point1(2,1),Point2(2,1),'- xr','MarkerSize', 18,'LineWidth' , 2.5) 
    plot(X_e,Y_e,'- om','MarkerSize', 18,'LineWidth' , 2.5) 
 %%   R_e R_o
 R_e=sqrt((Y_e-Y_o)^2+(X_e-X_o)^2) %Orignal to Elipse
 R_o1=sqrt((Point2(1,1)-Y_o)^2+(Point1(1,1)-X_o)^2) %Orignal to contact 1
 R_o2=sqrt((Point2(2,1)-Y_o)^2+(Point1(2,1)-X_o)^2) %Orignal to contact 2
 %for two different side!!! trignomatic
 if R_e>R_o1 %Hypto
 alpha1=acos(R_o1/R_e)
 else
 alpha1=acos(R_e/R_o1)   
 end
 if R_e>R_o2
 alpha2=acos(R_o2/R_e)    
 else
 alpha2=acos(R_e/R_o2)      
 end
%% Estimated Delta
Delta_r=.7; %Estimated shift on R_e
    if R_e>R_o1 %Hypto
    DRo1=(R_e+Delta_r)*cos(alpha1)-R_o1
    else
    DRo1=(1/cos(alpha1))*((R_e+Delta_r)-R_o1*cos(alpha1))
    end
     if R_e>R_o2 %Hypto
    DRo2=(R_e+Delta_r)*cos(alpha2)-R_o2
    else
    DRo2=(1/cos(alpha2))*((R_e+Delta_r)-R_o2*cos(alpha2))
    end
%% Finding New Tangent points
   m_ro1=((Point1(1,1)-X_o)/(Point2(1,1)-Y_o)); %the slope of tangent line Ro1
   m_ro2=((Point1(2,1)-X_o)/(Point2(2,1)-Y_o));%the slope of tangent line Ro2
   m_re=((X_e-X_o)/(Y_e-Y_o)); %the slope of Re (elipse position)
   %% Solving for finding (X_n1, Y_n1) and (X_n2,Y_n2)
syms X_n1 Y_n1 X_n2 Y_n2
FN1=(X_n1-Point1(1,1))^2+(Y_n1-Point2(1,1))^2==DRo1^2;
FN2=(m_ro1*(Y_n1-Point2(1,1)))-(X_n1-Point1(1,1))==0;
sold = solve([FN1, FN2], [X_n1, Y_n1]); % Solver may increase computation time, may solve it algebrically in future.
Pointn1a = double(sold.X_n1)
Pointn1b = double(sold.Y_n1)
%
FM1=(X_n2-Point1(2,1))^2+(Y_n2-Point2(2,1))^2==DRo2^2;
FM2=(m_ro2*(Y_n2-Point2(2,1)))-(X_n2-Point1(2,1))==0;
sold = solve([FM1, FM2], [X_n2, Y_n2]); % Solver may increase computation time, may solve it algebrically in future.
Pointn2a = double(sold.X_n2)
Pointn2b = double(sold.Y_n2)
if sqrt((Pointn1b(1,1)-Y_o)^2+(Pointn1a(1,1)-X_o)^2) > R_o1+DRo1 %Length must be longer than existing one always to find right points
X_nf1=Pointn1a(1,1);
Y_nf1=Pointn1b(1,1);
else
X_nf1=Pointn1a(2,1);
Y_nf1=Pointn1b(2,1);  
end
if sqrt((Pointn2b(1,1)-Y_o)^2+(Pointn2a(1,1)-X_o)^2) > R_o2+DRo2 %Length must be longer than existing one always to find right points
X_nf2=Pointn2a(1,1);
Y_nf2=Pointn2b(1,1);
else
X_nf2=Pointn2a(2,1);
Y_nf2=Pointn2b(2,1);  
end
    plot(X_nf1,Y_nf1,'- xy','MarkerSize', 18,'LineWidth' , 2.5) 
    plot(X_nf2,Y_nf2,'- xy','MarkerSize', 18,'LineWidth' , 2.5)     

%% Solving Equations of Elipse for a_n and b_n




 
 