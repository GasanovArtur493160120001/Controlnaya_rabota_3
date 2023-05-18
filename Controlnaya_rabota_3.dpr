program Controlnaya_rabota_3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
Vec3 = object
private
x, y, z, length: real;
public
constructor create(ax, ay, az: real);
function calc_length(): real;
end;

constructor Vec3.create(ax, ay, az: real);
begin
x := ax;
y := ay;
z := az;
length := calc_length();
end;

function Vec3.calc_length(): real;
begin
calc_length := sqrt(x * x + y * y + z * z);
end;

type
Container = object
private
data: array of Vec3;
public
constructor create_random(size: integer);
procedure print_all_vectors();
procedure add_vector(v: Vec3);
function find_shortest_vector(): Vec3;
end;

constructor Container.create_random(size: integer);
var
i,h: integer;
begin
h:=Length(data);
SetLength(data, size);
for i := h to size - 1 do
data[i].create(random, random, random);
end;

procedure Container.print_all_vectors();
var
i: integer;
begin
for i := 0 to Length(data) - 1 do
writeln('(', data[i].x:0:2, ',', data[i].y:0:2, ',', data[i].z:0:2, ')');
end;

procedure Container.add_vector(v: Vec3);
begin
SetLength(data, Length(data) + 1);
data[Length(data) - 1] := v;
end;

function Container.find_shortest_vector(): Vec3;
var
i: integer;
shortest: real;
shortestVec: Vec3;
begin
shortest := data[0].length;
shortestVec := data[0];
for i := 1 to Length(data) - 1 do
begin
if data[i].length < shortest then
begin
shortest := data[i].length;
shortestVec := data[i];
end;
end;
find_shortest_vector := shortestVec;
end;
var
b:Container;
a:Vec3;
l:integer;
x,y,z:real;
begin
l:=5;
while not(l=0) do
begin
Writeln('1. ������� ������ � ���������� ������������');
Writeln('2. ������� ��� ������� ');
Writeln('3. �������� ���� ������ ');
Writeln('4. ����� ����� �������� ������');
Writeln('������� ����� ������� ������� ������ ������������:');
Writeln('��� ���������� ������ ��������� ������� 0');
read(l);
if l=1 then
begin
Writeln('������� ���������� �������� ������� ������ ������� � ���������� ����������');
read(l);
b.create_random(l);
end
else if l=2 then
begin
b.print_all_vectors();
end
else if l=3 then
begin
Writeln('������� ���������� �������, ������� ������ �������: ');
read(x);
read(y);
read(z);
a.create(x,y,z);
b.add_vector(a);
end
else if l=4 then
begin
a:=b.find_shortest_vector();
Write('����� �������� ������ � ������������ (',a.x,';',a.y,';',a.z,')');
end
else if not(l=0) then
Writeln('��������, �� ����������� ����� �����, ������� ��� ������� ',l,' ������������.')
else
Writeln('����������!');
end;
end.
