function [a,b] =DQM_weights(x,N)
a=zeros(N,N);   % birinci dereceden türev için aðýrlýk katsayýlarý matrisi
b=zeros(N,N);   % ikinci dereceden türev için aðýrlýk katsayýlarý matrisi
m1=zeros(N);
for i=1:N
    carpim=1;
    for j=1:N
        if i ~= j
            carpim=carpim*(x(i)-x(j));
        end
    end
    m1(i)=carpim;
end

for i=1:N
    for j=1:N
        if i~=j
            a(i,j)=m1(i)/((x(i)-x(j))*m1(j));
        end
    end
end

for i=1:N
    toplam1=0;
    for j=1:N
        if i~=j
            toplam1=toplam1+a(i,j);
        end
    end
    a(i,i)=-toplam1;
end
for i=1:N
    for j=1:N
        if i~= j
            b(i, j) = 2 * a(i, j) * (a(i, i) - 1 / (x(i) - x(j)));
        end
    end
end

for i=1:N
    toplam2=0;
    for j=1:N
        if i~=j
            toplam2=toplam2+b(i,j);
        end
    end
    b(i,i)=-toplam2;
end
end