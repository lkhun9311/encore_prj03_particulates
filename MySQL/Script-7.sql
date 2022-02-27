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

-- 7번. 2021년 권역단위 월별 미세먼지 경보 발령 현황
create table result7_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "서울")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result8_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경기")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result9_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "인천")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result10_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "세종")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result11_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충북")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result12_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충남")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result13_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대전")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result14_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전북")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result15_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전남")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result16_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "광주")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result17_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대구")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result18_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경북")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result19_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경남")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result20_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "울산")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result21_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "부산")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result22_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "강원")
group by m.moveName, i.issueMonth
order by m.moveName;

create table result23_1
select i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "제주")
group by m.moveName, i.issueMonth
order by m.moveName;