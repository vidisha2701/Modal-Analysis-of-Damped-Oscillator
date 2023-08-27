clear;
M=[10 0;0 5];
K=[15 -5;-5 5];
zeta=[0.3;0.2];
[u,l]=eig(K,M)
for s=1:2
    alpha=sqrt(u(:,s)'*M*u(:,s));
    u(:,s)=u(:,s)/alpha;
end
x0=input('Enter the initial displacement column vector:');
v0=input('Enter the initial velocity column vector:');
tf=input('Enter the final time:');
t=0:0.1:tf
q=tf/0.1;
x=zeros(size(2,q));
for j=1:2
    w(j)=sqrt(l(j,j));
    wd(j)=w(j)*sqrt(1-zeta(j)^2);
    xt=u(:,j)*(u(:,j)'*M*x0*cos(w(j).*t)/sqrt(1-zeta(j)^2)+u(:,j)'*M*v0/w(j)*sin(w(j).*t)/wd(j));
    x=x+xt;
end
for i=1:2
    x(i,:)=x(i,:).*exp(-zeta(i)*x(i).*t);
end
for r=1:2
    subplot(2,1,r)
    plot(t,x(r,:))
    xlabel('Time,seconds');
    ylabel(['Response x',num2str(r)]);
end
