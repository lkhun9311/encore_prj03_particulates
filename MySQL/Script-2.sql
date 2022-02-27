select * from result2;
-- 2번(방법2 날짜 차이 반영). 2021년 전국단위 일별 미세먼지 경보 발령 현황 
drop table exercise101;
create table exercise101
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="1")
group by i.issueDay;
drop table exercise102;
create table exercise102
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="2")
group by i.issueDay;
drop table exercise103;
create table exercise103
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="3")
group by i.issueDay;
drop table exercise104;
create table exercise104
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="4")
group by i.issueDay;
drop table exercise105;
create table exercise105
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="5")
group by i.issueDay;
drop table exercise106;
create table exercise106
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="6")
group by i.issueDay;
drop table exercise107;
create table exercise107
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="7")
group by i.issueDay;
drop table exercise108;
create table exercise108
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="8")
group by i.issueDay;
drop table exercise109;
create table exercise109
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="9")
group by i.issueDay;
drop table exercise110;
create table exercise110
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="10")
group by i.issueDay;
drop table exercise111;
create table exercise111
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="11")
group by i.issueDay;
drop table exercise112;
create table exercise112
select distinct i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i
where (i.issueMonth="12")
group by i.issueDay;

-- table 생성 후 union
create table result2
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise101)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise102)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise103)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise104)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise105)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise106)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise107)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise108)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise109)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise110)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise111)
union
(select Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise112);
select * from result2;