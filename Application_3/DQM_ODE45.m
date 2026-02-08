clear all
close all
clc
tic
global N U D a b
U=0.01;                         % sabit akýþ hýzý
D=0.002;                        % daðýlým katsayýsý
N=101;                          % ayrýk nokta sayýsý
x=zeros(N,1);xmin=0;xmax=100;   % çözüm alaný
%-x-Yönü-PDQ-Ayrýk-Nokta-Daðýlýmý-----------------------------------------
for i=1:N
    x(i)=xmin+(0.5*(1-cos((i-1)/(N-1)*pi))*(xmax-xmin));
end
%-------------------------------------------------------------------------
[a,b] =DQM_weights(x, N);
%-Baþlangýç-Koþulu--------------------------------------------------------
C0=zeros(N,1);      % baþlangýç matrisi
for i=1:N
    C0(i)=0;
end
C0(1)=1;
%-------------------------------------------------------------------------
%-Zamanda-Ayrýklaþtýrma---------------------------------------------------
t0=0;               % t baþlangýç
tf=3000;            % t son
tspan=[t0 tf];
%-------------------------------------------------------------------------
%-ODE-Integration---------------------------------------------------------
options=odeset('RelTol',1e-10,'AbsTol',1e-10);
[t,C]=ode45(@func,tspan,C0,options);
Cnew=C(end,:);
%-------------------------------------------------------------------------
%-Analitik-Çözüm----------------------------------------------------------
h=(xmax-xmin)/(N-1);    % adým boyutu
xA=(xmin:h:xmax)';      % x-yönü ayrýk noktalar
Nx = size(xA,1);        % x-yönü ayrýk nokta sayýsý
CA=zeros(Nx,1);         % analitik çözüm matrisi
for i=1:Nx
    CA(i)=0.5*erfc((xA(i)-U*tf)/((4*D*tf)^(1/2)))...
        +0.5*exp(U*xA(i)/D)*erfc((xA(i)+U*tf)/((4*D*tf)^(1/2)));
end
%-------------------------------------------------------------------------
%--Ýstenilen-Çözüm-Aralýðý-Ýçin-Ýnterpolasyon-----------------------------
xint = linspace(xmin,xmax,N)';
Cint = lagrange_interp(x, Cnew, xint);
result=[xint Cint CA];
%-------------------------------------------------------------------------
%-Hata-Analizi------------------------------------------------------------
hata=abs(CA-Cint);                 % Hata
hata(1)=0;
L2=norm(hata,2);             % L2-norm
Linf=norm(hata,inf);     % L-sonsuz norm
Avg_err=sum(abs(hata))/N;   % Ortalama mutlak hata

fprintf('AAE \t=\t%.1e\n',Avg_err)
fprintf('L2 \t=\t%.1e\n',L2)
fprintf('Linf \t=\t%.1e\n\n',Linf)
%-------------------------------------------------------------------------
%-CPU-Zamaný--------------------------------------------------------------
fprintf('%.2f saniye sürdü...\n\n', toc) % toplam çalýþma süresi
%-------------------------------------------------------------------------
f = figure;
set(gcf,'color','w');
p=plot(xint,Cint,xint,CA);
p(1).Color = 'b';
p(1).LineWidth = 1.1;
p(1).Marker = 'o';

hold on

p(2).Color = 'k';
p(2).LineWidth = 1.1;
p(2).Marker = 'x';
xlim([0 100]) % x limit
ylim([0 1.1]) % y limit
xlabel('x (m)','FontWeight','bold','FontSize',10);
ylabel('C','FontWeight','bold','FontSize',10);

grid on
grid minor

legend({'ode45-DQM','Analytical Solution'},'FontSize',10,...
    'FontWeight','bold','Location','northeast','Orientation','vertical')
