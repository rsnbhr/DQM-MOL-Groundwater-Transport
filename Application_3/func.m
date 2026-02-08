function dCdt= func(t,C)
global N U D a b
dCdt=zeros(N,1);    % zamanda hesaplanan adi türev vektörü
%-Sýnýr-Koþullarý---------------------------------------------------------
C(1)=1; %Dirichlet Sýnýr Koþulu
%-------------------------------------------------------------------------
duN=0; %Neumann Sýnýr Þartý
C(N)=duN-sum(a(N,1:N-1)*C(1:N-1))/a(N,N);
%-Sayýsal-Türev-----------------------------------------------------------
Cx=a*C;     % birinci dereceden türev
Cxx=b*C;    % ikinci dereceden türev
%-------------------------------------------------------------------------
%-Zaman-Türevi-Ýçin-ODE-Sistem-Denklemi-----------------------------------
i=1;
dCdt(i)=0;
for i=2:N-1
    dCdt(i)=D*Cxx(i)-U*Cx(i);
end
i=N;
dCdt(i)=D*Cxx(i)-U*Cx(i);
%-------------------------------------------------------------------------
end