select * from result7_1;
select * from result8_1;
select * from result9_1;
select * from result10_1;
select * from result11_1;
select * from result12_1;
select * from result13_1;
select * from result14_1;
select * from result15_1;
select * from result16_1;
select * from result17_1;
select * from result18_1;
select * from result19_1;
select * from result20_1;
select * from result21_1;
select * from result22_1;
select * from result23_1;

-- 7��. 2021�� �ǿ����� ���� �̼����� �溸 �߷� ��Ȳ
create table result7_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result8_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result9_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "��õ")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result10_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result11_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result12_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�泲")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result13_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result14_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result15_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result16_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result17_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�뱸")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result18_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result19_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�泲")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result20_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result21_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�λ�")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result22_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result23_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueMonth
order by m.moveName;