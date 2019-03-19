function fEartoSun = fEartoSun(t)
J = JD(t);
fEartoSun = 1+0.033*cos(2*pi*J/365);
end