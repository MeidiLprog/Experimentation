function T = tools()
    T.tempoGraph = @tempoGraph;
    T.EGraph = @EGraph;
end

function tempoGraph(t,x)
    figure;
    plot(t,x,'LineWidth',1.5);

    xlabel('Time(s)');
    ylabel('Amplitude');
    title('Signal in Temporal domain');
    grid on
end


%{
Function to draw the Energie Graph W = module|x(s)|^2

%}

function [W,P] = EGraph(t,x)
    
    module = abs(x).^2;
    
    figure;
    plot(t,module,'LineWidth',1.5);
    xlabel('Time(s)');
    ylabel('|x(t)|^2');
    title('Energy Graph |x(t)|^2');
    grid on;
    W = trapz(t,module);

    %Duration delta t
    deltaT = t(end) - t(1);
    P = W / deltaT;


end