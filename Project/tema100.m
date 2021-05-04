function heatfourie1
L = pi*5;
a = 2/5;
tmax = 5;
steps = 50;
t=0:tmax/steps:tmax;
x=0:L/100:L;
    function y=phi(x)
        for i=1:length(x)
            if x(i)<=2*pi
                y(i)=100*(1-4^(x(i)^2-2*pi*x(i)))^3;
            else
                y(i)=0;
            end
        end
    end

    function y=heat(x,t)
        y=0;
        for k=0:45
            Xk=sin((2*k+1)*pi*x/(2*L));
            Ck=2*trapz(x,phi(x).*Xk)/L;
            Tk=Ck*exp(-(a*(2*k+1)*pi/(2*L))^2*t);
            y=y+Xk*Tk;
        end
    end

for n=1:length(t)
    plot(x,heat(x,t(n)));
    axis([0,L,-0.1,105]);
    grid on;
    M(n)=getframe;
end
movie(M,3);

subplot(3,1,1);
plot(x,phi(x));
title('t = 0');
axis([0,L,-0.1,105]);
grid on;
    
subplot(3,1,2);
plot(x,heat(x,t(round(steps/5))));
title(['t = ',num2str(t(round(steps/5)))]);
axis([0,L,-0.1,105]);
grid on;

subplot(3,1,3);
plot(x,heat(x,t(length(t))));
title(['t = ',num2str(tmax)]);
axis([0,L,-0.1,105]);
grid on;

end
