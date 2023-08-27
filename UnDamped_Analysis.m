clc;
M=[10 0;0 5]
K=[15 -5;-5 5]
A=inv(M)*K
I=eye(2);
E=eig(A);
X1=adjoint(A-(E(1)*I))
X2=adjoint(A-(E(2)*I))
P(:,1)=X1(:,1)
P(:,2)=X2(:,1)
t1=X1(:,1).'*M*X1(:,1)
t2=X2(:,1).'*M*X2(:,1)
a1=1/(sqrt(t1))
a2=1/(sqrt(t2))
xn1=a1*X1(:,1)
xn2=a2*X2(:,1)
Pn(:,1)=xn1
Pn(:,2)=xn2
Mn=Pn.'*M*Pn
Kn=Pn.'*K*Pn
w1=sqrt(Kn(1)/Mn(1))
w2=sqrt(Kn(4)/Mn(4))
tf=input("Enter Final Time")
t=0:0.1:tf

x0=[3;-2];
v0=[0;0];
q=tf/0.1;
w=[w1;w2];
y=zeros(size(2,q));

for j=1:2
    
    xt=Pn(:,j)*(Pn(:,j)'*M*x0*cos(w(j).*t)+(Pn(:,j)'*M*v0*sin(w(j).*t)/w(j)));
    y=y+xt;
end
for i =1:2
    subplot(2,1,i)
    plot(t,y(i,:))
    xlabel('Time,seconds');
    ylabel(['Response x',num2str(i)]);
end
