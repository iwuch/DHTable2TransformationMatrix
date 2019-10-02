%% Input the DHTable, Output the formular for each parameter in the
%% Transformation matrix

syms theta1 theta2 theta3 theta4 theta5 theta6 a2 a3 d3 d4

DHTable = [0        0       0       theta1;
           -pi/2    0       0       theta2;
           0        a2      d3      theta3;
           -pi/2    a3      d4      theta4;
           pi/2     0       0       theta5;
           -pi/2    0       0       theta6]
       
alpha   = DHTable(:,1)
a       = DHTable(:,2)
d       = DHTable(:,3)
theta   = DHTable(:,4)
DHsize  = size(DHTable)
dof     = DHsize(1)

for i = 1:dof
    T{i} = simplify(DHTable2T(theta(i), d(i), a(i), alpha(i))); % The function is Question 3(a)
end

T06 = T{1}*T{2}*T{3}*T{4}*T{5}*T{6}

r11 = T06(1,1)
r21 = T06(2,1)
r31 = T06(3,1)
r12 = T06(1,2)
r22 = T06(2,2)
r32 = T06(3,2)
r13 = T06(1,3)
r23 = T06(2,3)
r33 = T06(3,3)
px  = T06(1,4)
py  = T06(2,4)
pz  = T06(3,4)

subs(r11,{theta1 theta2 theta3 theta4 theta5 theta6 a2 a3 d3 d4},{pi/3 pi/3 pi/3 pi/3 pi/3 pi/3 1 2 3 4})