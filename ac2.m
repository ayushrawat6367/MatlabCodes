x_db=0:1:10;
x=10.^(x_db/10);
xth=10;
w=1.55.*(10.^(-6));
k=(2.*pi)./w;
L=1000;
D=0.08;
d_sq=(k.*(D.^2))./(4.*L);
Cn_sq=8.4.*(10.^(-15));
delta_sq=1.23.*(Cn_sq).*(k.^(7./6)).*(L.^(11./6));
delta=sqrt(delta_sq);
p1=((0.49.*delta_sq)./(1+(0.18.*d_sq)+(0.56.*(delta.^2.4))).^(7./6));
p2=((0.51.*delta_sq)./(1+(0.9.*d_sq)+(0.62.*d_sq.*(delta.^2.4))).^(5./6));
sig_sq=exp(p1+p2)-1;
sig=sqrt(sig_sq);
a=((-1).^(k+1))./k;
A=log(x)-sig_sq;
b=erfcx(sqrt(2).*sig.*k+A./(2.*sqrt(2).*sig));
c=erfcx(sqrt(2).*sig.*k-A./(2.*sqrt(2).*sig));
N=a.*(b+c);
syms x k
y1=symsum(N,k,1,Inf);
y2=4.*sig./(sqrt(2.*pi));
y3=A.*exp((A.^2)./(8.*sig_sq)).*erfc(-A./(2.*1.414.*sig));
Co=exp(-(A.^2)./(8.*sig_sq))./(2.*log(2));
F=y1+y2+y3;
C=Co.*F;
plot(x_db,C)
grid on
xlabel('Average electrical SNR');
ylabel('Average Channel Capacity');