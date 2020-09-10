u_db=0:1:20;
u=10.^(u_db/10);
uth=10;
a=2.902;
b=2.51;
r=1;
E_sq=1.1;
den=((2.*pi).^(r-1)).*gamma(a).*gamma(b);
num=(r.^(a+b+-2)).*(E_sq);
A=num./den;
n1=(a.*b).^r;
d1=r.^(2.*r);
B=n1./d1;
z=(B.*u)./uth;
G=meijerG([1],[(E_sq+1)./r],[(E_sq./r),(a./r),(b./r)],[0],z);
f=A.*G;
plot(u_db,f)
grid on