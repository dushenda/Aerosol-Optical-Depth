function J = JD(t)
J = day(t,'dayofyear');
% y = t.Year;
% m = t.Month;
% d = t.Day;
% switch m
%     case 1,sum = 0;
%     case 2,sum = 31;
%     case 3,sum = 59;
%     case 4,sum = 90;
%     case 5,sum = 120;
%     case 6,sum = 151;
%     case 7,sum = 181;
%     case 8,sum = 212;
%     case 9,sum = 243;
%     case 10,sum = 273;
%     case 11,sum = 304;
%     case 12,sum = 334;
%     otherwise,disp('´íÎóµÄÊäÈë');
% end
% J = sum+d;
% if((mod(y,400)==0)||((mod(y,4)&&mod(y,100)))~=0)
%     leap = 1;
% else
%     leap = 0;
% end
% if(leap == 1 && m >=2)
%     J=J+1;
% end
end