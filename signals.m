function S = signals()
    S.sinusoid = @sinusoid;
    S.door = @Door;
    S.Triangle = @Triangle;
    S.Convolution = @Convolution;
end


function x = sinusoid(t,f,type)
    
    if type == "sin"
        x = sin(2*pi*f*t);
    elseif type == "square"
        x = sign(sin(2*pi*f*t));
    
    elseif type == "triangle"
        %I build it myself
    end

end

function x = Door(t,A,t0,T)
    x = zeros(size(t));

    index = (t >= t0 - T/2) & ( t <=  t0 + T/2);

    x(index) = A; % Set the amplitude A for the duration of the door signal
      

end


function x = Triangle(t,A,t0,T)

    x = zeros(size(t));
    index = (t >= t0-T/2) & (t <= t0+T/2);
    x(index) = A * (1 - 2*abs(t(index)-t0)/T);   
end

function y = Convolution(x,h,dt)

    Nx = length(x);
    Nh = length(h);

    y = zeros(1,Nx + Nh - 1);

    for n = 1:Nx + Nh - 1

        for k = 1:Nx

            j = n-k+1;

            if j >= 1 && j <= Nh

                y(n) = y(n) + x(k)*h(j);

            end

        end

    end

    y = y*dt;

end