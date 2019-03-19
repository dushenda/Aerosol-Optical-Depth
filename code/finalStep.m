function [GammaAngle,zAngle]=finalStep(phi,delta,H,tem,pre)
%函数调用格式:[GammaAngle,zAngle]=FinalStep(phi,delta,H,tem,pre)
%输出参数[方位角GammaAngle(°),天顶角zAngle(°)]
%输入参数(纬度phi,赤纬delta,时角H,温度tem,压强pre)
e0 = asin(sin(phi).*sin(delta)+cos(phi).*cos(delta).*cos(H));      %计算升角e0=arcsin(sinφsinδ+cosφcosδcosH),计算都要弧度
%计算Δpe应该是修正量
deltape = -4.26*10^(-5)*cos(e0);                               %以地心为中心
ep = e0+deltape;
%计算方位角Γ=atan2(...)见下
Gamma = atan2(sin(H),cos(H).*sin(phi)-tan(delta).*cos(phi));
GammaAngle = Gamma*180/pi;
deltare = 0.08422*pre./((273+tem).*tan(ep+(0.003138./(ep+0.08919))));
%计算天顶角z
z = pi/2-ep-deltare;
zAngle = z*180/pi;
end