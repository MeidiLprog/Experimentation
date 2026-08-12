function S = signals()
    S.sinusoid = @sinusoid;
    S.door = @Door;
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