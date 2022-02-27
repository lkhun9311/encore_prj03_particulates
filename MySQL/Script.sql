select i.sn, d.districtName, m.moveName 
from information i, district d, move m 
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo)
order by i.districtNo;

drop table information;
CREATE TABLE information (
	clearVal int NOT NULL,
	sn int NOT null,
	districtNo int NOT null,
	issueVal int NOT NULL,
	issueTime int NOT NULL,
	clearMonth int NOT NULL,
	clearDay int NOT NULL,
	issueMonth int NOT NULL,
	issueDay int NOT NULL,
	moveNo int NOT null, 
	clearTime int NOT NULL,
	issueGbn varchar(20) NOT null,
	itemCode varchar(20) NOT NULL,
	
	constraint information_sn_pk primary key(sn)
);

drop table district;
CREATE TABLE district (
	districtNo int NOT null,
	districtName varchar(20) NOT null,
	
	constraint district_districtNo_pk primary key(districtNo)
);
insert into district values
(1,'서울');
insert into district values
(2,'경기');
insert into district values
(3,'인천');
insert into district values
(4,'세종');
insert into district values
(5,'충북');
insert into district values
(6,'충남');
insert into district values
(7,'대전');
insert into district values
(8,'전북');
insert into district values
(9,'전남');
insert into district values
(10,'광주');
insert into district values
(11,'대구');
insert into district values
(12,'경북');
insert into district values
(13,'경남');
insert into district values
(14,'울산');
insert into district values
(15,'부산');
insert into district values
(16,'강원');
insert into district values
(17,'제주');

drop table move;
CREATE TABLE move (
	moveNo int NOT null,
	moveName varchar(20) NOT null,
	
	constraint move_moveNo_pk primary key(moveNo)
);
insert into move values
(1,'통영권역');
insert into move values
(2,'사천권역');
insert into move values
(3,'하동권역');
insert into move values
(4,'남해권역');
insert into move values
(5,'고성권역');
insert into move values
(6,'거제권역');
insert into move values
(7,'합천권역');
insert into move values
(8,'진주권역');
insert into move values
(9,'산청권역');
insert into move values
(10,'창원권역');
insert into move values
(11,'함안권역');
insert into move values
(12,'함양권역');
insert into move values
(13,'의령권역');
insert into move values
(14,'창녕권역');
insert into move values
(15,'거창권역');
insert into move values
(16,'김해권역');
insert into move values
(17,'밀양권역');
insert into move values
(18,'양산권역');
insert into move values
(19,'영종영흥권역');
insert into move values
(20,'강화권역');
insert into move values
(21,'북부권역');
insert into move values
(22,'중부권역');
insert into move values
(23,'동부권역');
insert into move values
(24,'동남부권역');
insert into move values
(25,'서부권역');
insert into move values
(26,'영서남부권역');
insert into move values
(27,'영동남부권역');
insert into move values
(28,'영동북부권역');
insert into move values
(29,'영서북부권역');
insert into move values
(30,'울릉권역');
insert into move values
(31,'서울권역');
insert into move values
(32,'광주권역');
insert into move values
(33,'세종권역');
insert into move values
(34,'대구권역');
insert into move values
(35,'제주권역');
insert into move values
(36,'울산권역');
insert into move values
(37,'남부권역');

select * from district;
select * from move;
select * from information;
select i.sn, d.districtName, m.moveName 
from information i, district d, move m 
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo);
