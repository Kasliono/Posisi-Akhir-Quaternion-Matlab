clc;
clear all;
disp( 'Inputkan Posisi/Titik Awal [X, Y, Z] : ' );
disp( ' ' );
x = input('Nilai X = ');
y = input('Nilai Y = ');
z = input('Nilai Z = ');
teta = input('Teta = ');
tet = teta*pi/180;
disp( ' ' );
disp( 'Inputkan Koordinat n (Poros Rotasi) [X, Y, Z] : ' );
disp( ' ' );
nx = input('Koordinat n, X = ');
ny = input('Koordinat n, Y = ');
nz = input('Koordinat n, Z = ');
%P = [X Y Z]
n = [nx;ny;nz]
Q = [cos(tet/2) ; -n*sin(tet/2)]
Q1 = [cos(tet/2) ; n*(sin(tet/2))]

%Q(1,1) = s
%Q(2,1) = i
%Q(3,1) = j
%Q(4,1) = k

%X (Q*P)
Qx(1,1) = Q(1,1) * x ; %i
Qx(2,1) = Q(4,1) * x ; %j
Qx(3,1) = Q(3,1) * x * (-1); %k
Qx(4,1) = Q(2,1) * x * (-1); %s

%Y (Q*P)
Qy(1,1) = Q(4,1) * y ;%i
Qy(2,1) = Q(1,1) * y ;%j
Qy(3,1) = Q(2,1) * y * (-1); %k
Qy(4,1) = Q(3,1) * y * (-1); %s

%Z (Q*P)
Qz(1,1) = Q(3,1) * z ; %i
Qz(2,1) = Q(2,1) * z * (-1); %j
Qz(3,1) = Q(1,1) * z ;  %k
Qz(4,1) = Q(4,1) * z * (-1);  %s

SUM1 = Qx + Qy + Qz;

%SUM1(1,1) = i
%SUM1(2,1) = j
%SUM1(3,1) = k
%SUM1(4,1) = s

%Q1(1,1) = s
%Q1(2,1) = i
%Q1(3,1) = j
%Q1(4,1) = k

%S ((Q*P)*Q1)
Q1s(1,1) = SUM1(1,1) * Q1(1,1); %i
Q1s(2,1) = SUM1(2,1) * Q1(1,1); %j
Q1s(3,1) = SUM1(3,1) * Q1(1,1); %k
Q1s(4,1) = SUM1(4,1) * Q1(1,1); %s

%i ((Q*P)*Q1)
Q1x(1,1) = SUM1(4,1) * Q1(2,1); %i
Q1x(2,1) = SUM1(3,1) * Q1(2,1); %j
Q1x(3,1) = SUM1(2,1) * Q1(2,1) * (-1) ; %k
Q1x(4,1) = SUM1(1,1) * Q1(2,1) * (-1); %s

%j ((Q*P)*Q1)
Q1y(1,1) = SUM1(3,1) * Q1(3,1) * (-1); %i
Q1y(2,1) = SUM1(4,1) * Q1(3,1) ; %j
Q1y(3,1) = SUM1(1,1) * Q1(3,1) ;  %k
Q1y(4,1) = SUM1(2,1) * Q1(3,1) * (-1);  %s

%k ((Q*P)*Q1)
Q1z(1,1) = SUM1(2,1) * Q1(4,1) ; %i
Q1z(2,1) = SUM1(1,1) * Q1(4,1) * (-1); %j
Q1z(3,1) = SUM1(4,1) * Q1(4,1) ;  %k
Q1z(4,1) = SUM1(3,1) * Q1(4,1) * (-1);  %s

SUM2 = Q1s + Q1x + Q1y + Q1z;

%SUM2(1,1) = i
%SUM2(2,1) = j
%SUM2(3,1) = k
%SUM2(4,1) = s
disp( 'Posisi/Titik Akhir Setelah Rotasi : ' );
disp( ' ' );
disp(['Posisi Akhir X   =  ',num2str(SUM2(1)),])
disp(['Posisi Akhir Y   =  ',num2str(SUM2(2)),])
disp(['Posisi Akhir Z   =  ',num2str(SUM2(3)),])