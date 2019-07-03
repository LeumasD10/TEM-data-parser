% Particles is a 2xn matrix, 1st row is diameters, 2nd row is its aggregate
% ID given from the Manual Code
% Returns an array of diameter groups pertaining to their aggregate
function arrayOfDiams = sortparticle(particles)
    previousid = particles(2,1);
    container = [];
    arrayOfDiams = {};
    for i = 1:1:size(particles,2)
        idcurrent = particles(2,i);
        if isequal(idcurrent,previousid)
            container = [container, particles(1,i)];
        else
            arrayOfDiams = [arrayOfDiams, container];
            container = [particles(1,i)];
            previousid = idcurrent;
        end
    end
    
    if isequal(idcurrent,previousid)
        arrayOfDiams = [arrayOfDiams, container];
    end
end

