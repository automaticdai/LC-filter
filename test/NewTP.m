function F = NewTP(x,REF1)
x_0 = REF1(1,1);%Elipse center coordinate
y_0 = REF1(1,2);
DR = REF1(1,3);
m_l = REF1(1,4);%Original coordinate
 
%global x_n1
x_1 = x(1);
y_2 = x(2);

x_n1 = x_0+sqrt(abs(DR^2-(y_2-y_0)^2)); 
y_n1 = y_0-sqrt(abs(DR^2-(x_1-x_0)^2)); 
F(1) = y_0+(m_l)*(x_n1-x_0); 
F(2) = x_0+(1/m_l)*(y_n1-y_0);  

%x_n1=x_0-sqrt(DR^2-(y_n1-y_0)^2);
%x_n1=x_0-m_l*(y_n1-y_0);



%% DR>x-x0
% global x_n1
% y_n1=x(1);
% x_n1=x_0+((m_l)*(y_n1-y_0));
% F(1)=y_0-sqrt(abs(DR^2-(x_n1-x_0)^2));
%% DR<x-x0
%
%
%
%
%%
%Case 1 
%y_n1=y_0+(1/m_l)*(x_n1-x_0);
%F(1)=x_0+sqrt(DR^2-(y_n1-y_0)^2);
%Case 2
% x_n1=x_0+(m_l)*(y_n1-y_0);
% F(1)=y_0-sqrt(DR^2-(x_n1-x_0)^2);
%Case 3
%y_n1=y_0+sqrt(DR^2-(x_n1-x_0)^2); t
%F(1)=x_0+(m_l)*(y_n1-y_0);
%Case 4
% x_n1=x_0-sqrt(DR^2-(y_n1-y_0)^2);
% F(1)=y_0+(1/m_l)*(x_n1-x_0);

%FM1=(X_n2-Point1(2,1))^2+(Y_n2-Point2(2,1))^2==DRo2^2;
%FM2=(m_ro2*(Y_n2-Point2(2,1)))-(X_n2-Point1(2,1))==0;

end
