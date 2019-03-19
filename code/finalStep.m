function [GammaAngle,zAngle]=finalStep(phi,delta,H,tem,pre)
%�������ø�ʽ:[GammaAngle,zAngle]=FinalStep(phi,delta,H,tem,pre)
%�������[��λ��GammaAngle(��),�춥��zAngle(��)]
%�������(γ��phi,��γdelta,ʱ��H,�¶�tem,ѹǿpre)
e0 = asin(sin(phi).*sin(delta)+cos(phi).*cos(delta).*cos(H));      %��������e0=arcsin(sin��sin��+cos��cos��cosH),���㶼Ҫ����
%���㦤peӦ����������
deltape = -4.26*10^(-5)*cos(e0);                               %�Ե���Ϊ����
ep = e0+deltape;
%���㷽λ�Ǧ�=atan2(...)����
Gamma = atan2(sin(H),cos(H).*sin(phi)-tan(delta).*cos(phi));
GammaAngle = Gamma*180/pi;
deltare = 0.08422*pre./((273+tem).*tan(ep+(0.003138./(ep+0.08919))));
%�����춥��z
z = pi/2-ep-deltare;
zAngle = z*180/pi;
end