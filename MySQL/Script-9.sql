select * from result7_3;
select * from result8_3;
select * from result9_3;
select * from result10_3;
select * from result11_3;
select * from result12_3;
select * from result13_3;
select * from result14_3;
select * from result15_3;
select * from result16_3;
select * from result17_3;
select * from result18_3;
select * from result19_3;
select * from result20_3;
select * from result21_3;
select * from result22_3;
select * from result23_3;

-- 9��. 2021�� �ǿ����� �ð��� �̼����� �溸 �߷� ��Ȳ
create table result7_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result8_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result9_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "��õ")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result10_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result11_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result12_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�泲")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result13_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result14_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result15_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result16_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result17_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�뱸")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result18_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result19_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�泲")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result20_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "���")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result21_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "�λ�")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result22_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;

create table result23_3
select i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "����")
group by m.moveName, i.issueTime
order by m.moveName, i.issueTime;