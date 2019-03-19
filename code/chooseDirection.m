 function [addEW,signNS]=chooseDirection(direction)
switch direction
    case 1
        addEW=0;signNS=1;
    case 2
        addEW=0;signNS=-1;
    case 3
        addEW=180;signNS=1;
    case 4
        addEW=0;signNS=-1;
end
end