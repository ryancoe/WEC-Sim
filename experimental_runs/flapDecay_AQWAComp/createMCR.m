%create case list
clear all
mcr.header={'body(2).linearDamping(5)', 'body(2).initDisp.initAngularDispAngle', 'body(2).initDisp.initLinDisp(1)', 'body(2).initDisp.initLinDisp(2)', 'body(2).initDisp.initLinDisp(3)'};
mcr.cases = zeros(12,5);
mcr.cases(:,1) = [ones(3,1)*0; ones(3,1)*0.5; ones(3,1)*1; ones(3,1)*1.5];
tmp = [5;10;15];
mcr.cases(:,2) = [tmp;tmp;tmp;tmp]*pi/180;
r = 0.5 - 0.338; alpha = mcr.cases(:,2);
mcr.cases(:,3) = r*sin(alpha);
mcr.cases(:,4) = zeros(12,1);
mcr.cases(:,5) = -1*r*(1-cos(alpha));
clear r alpha tmp


