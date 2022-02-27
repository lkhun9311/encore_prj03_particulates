select * from result5;
-- 5��(���2 ������). 2021�� �������� �Ϻ� �̼����� �溸 �߷� ��Ȳ
drop table exercise201;
create table exercise201
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise202;
create table exercise202
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise203;
create table exercise203
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "��õ")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise204;
create table exercise204
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise205;
create table exercise205
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise206;
create table exercise206
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�泲")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise207;
create table exercise207
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise208;
create table exercise208
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise209;
create table exercise209
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise210;
create table exercise210
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise211;
create table exercise211
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�뱸")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise212;
create table exercise212
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise213;
create table exercise213
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�泲")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise214;
create table exercise214
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise215;
create table exercise215
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�λ�")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise216;
create table exercise216
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;
drop table exercise217;
create table exercise217
select i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueDay
order by i.issueMonth, i.issueDay;

-- table ���� �� union
create table result5
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise201)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise202)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise203)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise204)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise205)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise206)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise207)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise208)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise209)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise210)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise211)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise212)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise213)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise214)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise215)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise216)
union
(select districtNo, districtName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise217);