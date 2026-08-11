function S = signals()
    S.sinusoid = @sinusoid;
end


function x = sinusoid(t,type)
    
    if type == "sin"
        x = sin(2*pi*50*t);
    elseif type == "square"
        x = sign(sin(2*pi*50*t));
    
    elseif type == "triangle"
        %I build it myself
    end

end