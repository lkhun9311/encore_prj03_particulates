select * from result7_2;
select * from result8_2;
select * from result9_2;
select * from result10_2;
select * from result11_2;
select * from result12_2;
select * from result13_2;
select * from result14_2;
select * from result15_2;
select * from result16_2;
select * from result17_2;
select * from result18_2;
select * from result19_2;
select * from result20_2;
select * from result21_2;
select * from result22_2;
select * from result23_2;

-- 8번(방법2 디테일). 2021년 권역단위 일별 미세먼지 경보 발령 현황
drop table exercise301;
create table exercise301
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "서울")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise302;
create table exercise302
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경기")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise303;
create table exercise303
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "인천")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise304;
create table exercise304
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "세종")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise305;
create table exercise305
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충북")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise306;
create table exercise306
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충남")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise307;
create table exercise307
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대전")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise308;
create table exercise308
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전북")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise309;
create table exercise309
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전남")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise310;
create table exercise310
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "광주")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise311;
create table exercise311
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대구")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise312;
create table exercise312
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경북")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise313;
create table exercise313
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경남")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise314;
create table exercise314
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "울산")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise315;
create table exercise315
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "부산")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise316;
create table exercise316
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "강원")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

drop table exercise317;
create table exercise317
select i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information i, district d, move m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "제주")
group by m.moveName, i.issueMonth, i.issueDay
order by m.moveName;

-- table 생성 
create table result7_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise301);

create table result8_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise302);

create table result9_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise303);

create table result10_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise304);

create table result11_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise305);

create table result12_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise306);

create table result13_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise307);

create table result14_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise308);

create table result15_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise309);

create table result16_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise310);

create table result17_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise311);

create table result18_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise312);

create table result19_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise313);

create table result20_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise314);

create table result21_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise315);

create table result22_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise316);

create table result23_2
(select districtNo, districtName, moveName, Month, Day1 "Day_start", Day2 "Day_end", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise317);