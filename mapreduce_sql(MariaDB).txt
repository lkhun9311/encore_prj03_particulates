[mariadb로 csv파일을 가져오기]
create database miniPrj02 default charset=utf8;

create table district (districtNo int NOT NULL, districtName varchar(32) NOT NULL, PRIMARY KEY (districtNo)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
load data local infile '/home/hadoop/data/district.csv' into table district fields terminated by ',' lines terminated by '\n';

create table move (moveNo int NOT NULL, moveName varchar(32) NOT NULL, PRIMARY KEY (moveNo)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
load data local infile '/home/hadoop/data/move.csv' into table move fields terminated by ',' lines terminated by '\n';

create table information (clearVal int NOT NULL, sn int NOT NULL, districtNo int NOT NULL, issueVal int NOT NULL, issueTime int NOT NULL, clearMonth int NOT NULL, clearDay int NOT NULL, issueMonth int NOT NULL, issueDay int NOT NULL, moveNo int NOT NULL, clearTime int NOT NULL, issueGbn varchar(32) NOT NULL, itemCode varchar(32) NOT NULL, PRIMARY KEY (sn), foreign key(districtNo) references district(districtNo), foreign key(moveNo) references move(moveNo)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
load data local infile '/home/hadoop/data/information.csv' into table information fields terminated by ',' lines terminated by '\n';

[utf-8로 설정]
show variables like 'c%';

[테이블 생성]
create table information_exp (clearVal int NOT NULL, sn int NOT NULL, districtNo int NOT NULL, issueVal int NOT NULL, issueTime int NOT NULL, clearMonth int NOT NULL, clearDay int NOT NULL, issueMonth int NOT NULL, issueDay int NOT NULL, moveNo int NOT NULL, clearTime int NOT NULL, issueGbn varchar(32) NOT NULL, itemCode varchar(32) NOT NULL, PRIMARY KEY (sn), foreign key(districtNo) references district(districtNo), foreign key(moveNo) references move(moveNo)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table district_exp (districtNo int NOT NULL, districtName varchar(32) NOT NULL, PRIMARY KEY (districtNo)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table move_exp (moveNo int NOT NULL, moveName varchar(32) NOT NULL, PRIMARY KEY (moveNo)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[sqoop]
<< mariadb --> sqoop --> hdfs >> 
sqoop import --connect "jdbc:mysql://localhost:3306/fruits_db" --table fruits --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/fruits
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table information --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/information
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table district --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/district
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table move --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/move

<< 내용 확인 >>
hdfs dfs -cat /user/hadoop/sqoopdata/information/part-m-0000*
hdfs dfs -cat /user/hadoop/sqoopdata/district/part-m-0000*
hdfs dfs -cat /user/hadoop/sqoopdata/move/part-m-0000*

<< hdfs  --> sqoop --> mariadb >>
sqoop export --connect "jdbc:mysql://localhost:3306/miniPrj02" --table information_exp --username "root" --password "1234" --export-dir /user/hadoop/sqoopdata/information
sqoop export --connect "jdbc:mysql://localhost:3306/miniPrj02" --table district_exp --username "root" --password "1234" --export-dir /user/hadoop/sqoopdata/district
sqoop export --connect "jdbc:mysql://localhost:3306/miniPrj02" --table move_exp --username "root" --password "1234" --export-dir /user/hadoop/sqoopdata/move

[mariaDB]
[informaion_exp, district_exp, move_exp를 활용해 통계결과 테이블 생성]
-- 1번. 2021년 전국단위 월별 미세먼지 경보 발령 현황 
#create table result1 (Month int NOT NULL, PM2.5 int NOT NULL, PM10 int NOT NULL, SUM int NOT NULL, PRIMARY KEY (Month)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#원래는 바로 윗 코드 입력 후 primary key를 지정하고나서 create table을 했어야 했다. linux에서 sqoop import 명령어 입력시 primaey_key가 result1 table에 생성되어 있지 않은 상태이므로 오류가 발생했고, mariadb sql에서 아랫 코드 입력 후 sqoop import 재입력시 성공했다.
# alter table result_1 add primary key(Month);

create table result1 select i.issueMonth "Month", count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i group by i.issueMonth order by i.issueMonth;
alter table result_1 add primary key(Month);

-- 2번(방법2 날짜 차이 반영). 2021년 전국단위 일별 미세먼지 경보 발령 현황 
create table exercise101 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="1") group by i.issueDay;
create table exercise102 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="2") group by i.issueDay;
create table exercise103 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="3") group by i.issueDay;
create table exercise104 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="4") group by i.issueDay;
create table exercise105 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="5") group by i.issueDay;
create table exercise106 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="6") group by i.issueDay;
create table exercise107 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="7") group by i.issueDay;
create table exercise108 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="8") group by i.issueDay;
create table exercise109 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="9") group by i.issueDay;
create table exercise110 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="10") group by i.issueDay;
create table exercise111 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="11") group by i.issueDay;
create table exercise112 select distinct i.sn "serial_no", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i where (i.issueMonth="12") group by i.issueDay;

-- table 생성 후 union
create table result2 (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise101) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise102) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise103) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise104) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise105) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise106) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise107) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise108) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise109) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise110) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise111) union (select serial_no, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise112);

alter table result2 add primary key(serial_no);

-- 3번. 2021년 전국단위 시간별 미세먼지 경보 발령 현황 
create table result3 select i.issueTime, count(i.issueTime) "Sum" from information_exp i group by i.issueTime order by i.issueTime;

alter table result3 add primary key(i.issueTime);

-- 4번. 2021년 지역단위 월별 미세먼지 경보 발령 현황
create table result4 select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "서울") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경기") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "인천") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "세종") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "충북") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "충남") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "대전") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "전북") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "전남") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "광주") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "대구") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경북") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경남") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "울산") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "부산") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "강원") group by i.issueMonth union select i.sn "serial_no", i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "제주") group by i.issueMonth order by districtNo, districtName, issueMonth;

alter table result4 add primary key(serial_no);

-- 5번(방법2 디테일). 2021년 지역단위 일별 미세먼지 경보 발령 현황
create table exercise201 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "서울") group by i.issueMonth, i.issueDay;
create table exercise202 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경기") group by i.issueMonth, i.issueDay;
create table exercise203 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "인천") group by i.issueMonth, i.issueDay;
create table exercise204 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "세종") group by i.issueMonth, i.issueDay;
create table exercise205 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "충북") group by i.issueMonth, i.issueDay;
create table exercise206 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "충남") group by i.issueMonth, i.issueDay;
create table exercise207 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "대전") group by i.issueMonth, i.issueDay;
create table exercise208 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "전북") group by i.issueMonth, i.issueDay;
create table exercise209 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "전남") group by i.issueMonth, i.issueDay;
create table exercise210 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "광주") group by i.issueMonth, i.issueDay;
create table exercise211 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "대구") group by i.issueMonth, i.issueDay;
create table exercise212 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경북") group by i.issueMonth, i.issueDay;
create table exercise213 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경남") group by i.issueMonth, i.issueDay;
create table exercise214 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "울산") group by i.issueMonth, i.issueDay;
create table exercise215 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "부산") group by i.issueMonth, i.issueDay;
create table exercise216 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "강원") group by i.issueMonth, i.issueDay;
create table exercise217 select i.sn "serial_no", i.districtNo "districtNO", d.districtName "districtName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "제주") group by i.issueMonth, i.issueDay;

-- table 생성 후 union
create table result5 (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise201) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise202) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise203) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise204) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise205) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise206) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise207) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise208) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise209) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise210) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise211) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise212) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise213) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise214) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise215) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise216) union (select serial_no, districtNo, districtName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" from exercise217); 

alter table result5 add primary key(serial_no);

-- 6번. 2021년 지역단위 시간별 미세먼지 경보 발령 현황
create table result6 select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "서울") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경기") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "인천") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "세종") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "충북") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "충남") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "대전") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "전북") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "전남") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "광주") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "대구") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경북") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "경남") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "울산") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "부산") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "강원") group by i.issueTime union select i.sn "serial_no", i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum" from information_exp i, district_exp d where (i.districtNo = d.districtNo) and (d.districtName = "제주") group by i.issueTime order by districtNo, districtName, issueTime;

alter table result6 add primary key(serial_no);

-- 7-1~23-1. 2021년 지역별 권역단위 월별 미세먼지 경보 발령 현황
-- 예시. 7-1. 2021년 서울 권역단위 월별 미세먼지 경보 발령 현황
create table result7_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "서울")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result7_1 add primary key(serial_no);

create table result8_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경기")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result8_1 add primary key(serial_no);

create table result9_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "인천")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result9_1 add primary key(serial_no);

create table result10_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "세종")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result10_1 add primary key(serial_no);

create table result11_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충북")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result11_1 add primary key(serial_no);

create table result12_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충남")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result12_1 add primary key(serial_no);

create table result13_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대전")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result13_1 add primary key(serial_no);

create table result14_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전북")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result14_1 add primary key(serial_no);

create table result15_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전남")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result15_1 add primary key(serial_no);

create table result16_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "광주")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result16_1 add primary key(serial_no);

create table result17_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대구")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result17_1 add primary key(serial_no);

create table result18_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경북")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result18_1 add primary key(serial_no);

create table result19_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경남")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result19_1 add primary key(serial_no);

create table result20_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "울산")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result20_1 add primary key(serial_no);

create table result21_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "부산")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result21_1 add primary key(serial_no);

create table result22_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "강원")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result22_1 add primary key(serial_no);

create table result23_1
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "제주")
group by m.moveName, i.issueMonth
order by m.moveName;
alter table result23_1 add primary key(serial_no);

-- 7-2~23-2. 2021년 지역별 권역단위 일별 미세먼지 경보 발령 현황
-- 예시. 7-2. 2021년 서울 권역단위 일별 미세먼지 경보 발령 현황
create table exercise301
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "서울")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result7_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum"
from exercise301;
alter table result7_2 add primary key(serial_no);

create table exercise302
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경기")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result8_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise302;
alter table result8_2 add primary key(serial_no);

create table exercise303
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "인천")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result9_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise303;
alter table result9_2 add primary key(serial_no);

create table exercise304
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "세종")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result10_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise304;
alter table result10_2 add primary key(serial_no);

create table exercise305
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충북")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result11_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise305;
alter table result11_2 add primary key(serial_no);

create table exercise306
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충남")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result12_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise306;
alter table result12_2 add primary key(serial_no);

create table exercise307
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대전")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result13_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise307;
alter table result13_2 add primary key(serial_no);

create table exercise308
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전북")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result14_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise308;
alter table result14_2 add primary key(serial_no);

create table exercise309
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전남")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result15_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise309;
alter table result15_2 add primary key(serial_no);

create table exercise310
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "광주")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result16_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise310;
alter table result16_2 add primary key(serial_no);

create table exercise311
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대구")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result17_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise311;
alter table result17_2 add primary key(serial_no);

create table exercise312
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경북")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result18_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise312;
alter table result18_2 add primary key(serial_no);

create table exercise313
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경남")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result19_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise313;
alter table result19_2 add primary key(serial_no);

create table exercise314
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "울산")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result20_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise314;
alter table result20_2 add primary key(serial_no);

create table exercise315
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "부산")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result21_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise315;
alter table result21_2 add primary key(serial_no);

create table exercise316
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "강원")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result22_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise316;
alter table result22_2 add primary key(serial_no);

create table exercise317
select i.sn "serial_no", i.districtNo "districtNo", d.districtName "districtName", m.moveName "moveName", i.issueMonth "Month", i.issueDay "Day1", i.clearDay "Day2", count(case when i.itemCode="PM2.5" then 1 end)*(i.clearDay-i.issueDay+1) as "PM25", count(case when i.itemCode="PM10" then 1 end)*(i.clearDay-i.issueDay+1) as "PM10"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "제주")
group by i.issueDay, i.issueMonth, m.moveName
order by m.moveName, i.issueMonth, i.issueDay;

create table result23_2
select serial_no, districtNo, districtName, moveName, Month, Day1 "Day (start)", Day2 "Day (end)", PM25 "PM2.5", PM10, (PM25+PM10) "Sum" 
from exercise317;
alter table result23_2 add primary key(serial_no);

-- 7-3~23-3. 2021년 지역별 권역단위 시간별 미세먼지 경보 발령 현황
-- 예시. 7-3. 2021년 서울 권역단위 시간별 미세먼지 경보 발령 현황
create table result7_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "서울")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result7_3 add primary key(serial_no);

create table result8_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경기")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result8_3 add primary key(serial_no);

create table result9_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "인천")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result9_3 add primary key(serial_no);

create table result10_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "세종")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result10_3 add primary key(serial_no);

create table result11_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충북")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result11_3 add primary key(serial_no);

create table result12_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "충남")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result12_3 add primary key(serial_no);

create table result13_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대전")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result13_3 add primary key(serial_no);

create table result14_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전북")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result14_3 add primary key(serial_no);

create table result15_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "전남")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result15_3 add primary key(serial_no);

create table result16_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "광주")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result16_3 add primary key(serial_no);

create table result17_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "대구")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result17_3 add primary key(serial_no);

create table result18_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경북")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result18_3 add primary key(serial_no);

create table result19_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "경남")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result19_3 add primary key(serial_no);

create table result20_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "울산")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result20_3 add primary key(serial_no);

create table result21_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "부산")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result21_3 add primary key(serial_no);

create table result22_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "강원")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result22_3 add primary key(serial_no);

create table result23_3
select i.sn "serial_no", i.districtNo, d.districtName, m.moveName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information_exp i, district_exp d, move_exp m
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
and (d.districtName = "제주")
group by i.issueTime
order by m.moveName, i.issueTime;
alter table result23_3 add primary key(serial_no);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[sqoop]
<< mariadb --> sqoop --> hdfs >> 
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table information_exp --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/information_exp
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table district_exp --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/district_exp
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table move_exp --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/move_exp

sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result4 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result4
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result5 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result5
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result6 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result6
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result7_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result7_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result7_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result7_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result7_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result7_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result8_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result8_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result8_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result8_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result8_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result8_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result9_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result9_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result9_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result9_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result9_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result9_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result10_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result10_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result10_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result10_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result10_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result10_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result11_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result11_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result11_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result11_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result11_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result11_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result12_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result12_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result12_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result12_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result12_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result12_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result13_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result13_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result13_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result13_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result13_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result13_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result14_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result14_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result14_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result14_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result14_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result14_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result15_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result15_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result15_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result15_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result15_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result15_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result16_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result16_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result16_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result16_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result16_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result16_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result17_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result17_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result17_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result17_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result17_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result17_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result18_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result18_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result18_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result18_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result18_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result18_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result19_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result19_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result19_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result19_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result19_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result19_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result20_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result20_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result20_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result20_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result20_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result20_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result21_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result21_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result21_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result21_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result21_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result21_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result22_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result22_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result22_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result22_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result22_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result22_3
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result23_1 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result23_1
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result23_2 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result23_2
sqoop import --connect "jdbc:mysql://localhost:3306/miniPrj02" --table result23_3 --username "root" --password "1234" --target-dir /user/hadoop/sqoopdata/result23_3

>> hdfs에 테이블 저장 완료