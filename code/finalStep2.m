function [GammaAngle,zAngle]=finalStep2(phi,delta,H,tem,pre)
sphi = sin(phi);cphi = sqrt(1-sphi.^(2));
sdelta = sin(delta);cdelta = sqrt(1-sdelta.^(2));
sH = sin(H);cH = cos(H);
se0 = sphi.*sdelta+cphi.*cdelta.*cH;
ep = asin(se0)-4.26*10^(-5)*sqrt(1-se0.^2);
Gamma = atan2(sH,cH.*sphi-sdelta.*cdelta./cdelta);
GammaAngle = Gamma*180/pi;
deltare = 0.08422*pre./((273+tem).*tan(ep+(0.003138./(ep+0.08919))));
z = pi/2-ep-deltare;
zAngle = z*180/pi;
end