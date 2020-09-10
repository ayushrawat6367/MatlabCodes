x_db=0:1:20;
x=10.^(x_db/10);
xth=10;
w=1.55.*(10.^(-6));
k=(2.*pi)./w;
L=1000;
D=0.08;
d_sq=(k.*(D.^2))./(4.*L);
Cn1=8.4.*(10.^(-15));
delta_sq1=1.23.*(Cn1).*(k.^(7./6)).*(L.^(11./6));
Cn2=1.7.*(10.^(-14));
delta_sq2=1.23.*(Cn2).*(k.^(7./6)).*(L.^(11./6));
Cn3=5.*(10.^(-14));
delta_sq3=1.23.*(Cn3).*(k.^(7./6)).*(L.^(11./6));
delta1=sqrt(delta_sq1);
delta2=sqrt(delta_sq2);
delta3=sqrt(delta_sq3);
p1=((0.49.*delta_sq1)./(1+(0.18.*d_sq)+(0.56.*(delta1.^2.4))).^(7./6));
p2=((0.51.*delta_sq1)./(1+(0.9.*d_sq)+(0.62.*d_sq.*(delta1.^2.4))).^(5./6));
sig_sq=exp(p1+p2)-1;
a=log(x./xth);
b=2.*(sqrt(2.*sig_sq));
y1=0.5.*erfc((a-sig_sq)./b);
plot(x_db,y1)
grid on;
xlabel('xdb1');
ylabel('Outage Probability');
hold on
p3=((0.49.*delta_sq2)./(1+(0.18.*d_sq)+(0.56.*(delta2.^2.4))).^(7./6));
p4=((0.51.*delta_sq2)./(1+(0.9.*d_sq)+(0.62.*d_sq.*(delta2.^2.4))).^(5./6));
sig_sq=exp(p3+p4)-1;
a=log(x./xth);
b=2.*(sqrt(2.*sig_sq));
y2=0.5.*erfc((a-sig_sq)./b);
plot(x_db,y2)
p4=((0.49.*delta_sq3)./(1+(0.18.*d_sq)+(0.56.*(delta3.^2.4))).^(7./6));
p5=((0.51.*delta_sq3)./(1+(0.9.*d_sq)+(0.62.*d_sq.*(delta3.^2.4))).^(5./6));
sig_sq=exp(p4+p5)-1;
a=log(x./xth);
b=2.*(sqrt(2.*sig_sq));
y3=0.5.*erfc((a-sig_sq)./b);
plot(x_db,y3)
hold off
legend('Cn=8.4*10^-15' , 'Cn=1.7*10^-14' , 'Cn=5*10^-14')