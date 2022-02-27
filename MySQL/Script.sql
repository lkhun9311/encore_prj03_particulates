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
(1,'����');
insert into district values
(2,'���');
insert into district values
(3,'��õ');
insert into district values
(4,'����');
insert into district values
(5,'���');
insert into district values
(6,'�泲');
insert into district values
(7,'����');
insert into district values
(8,'����');
insert into district values
(9,'����');
insert into district values
(10,'����');
insert into district values
(11,'�뱸');
insert into district values
(12,'���');
insert into district values
(13,'�泲');
insert into district values
(14,'���');
insert into district values
(15,'�λ�');
insert into district values
(16,'����');
insert into district values
(17,'����');

drop table move;
CREATE TABLE move (
	moveNo int NOT null,
	moveName varchar(20) NOT null,
	
	constraint move_moveNo_pk primary key(moveNo)
);
insert into move values
(1,'�뿵�ǿ�');
insert into move values
(2,'��õ�ǿ�');
insert into move values
(3,'�ϵ��ǿ�');
insert into move values
(4,'���رǿ�');
insert into move values
(5,'���ǿ�');
insert into move values
(6,'�����ǿ�');
insert into move values
(7,'��õ�ǿ�');
insert into move values
(8,'���ֱǿ�');
insert into move values
(9,'��û�ǿ�');
insert into move values
(10,'â���ǿ�');
insert into move values
(11,'�Ծȱǿ�');
insert into move values
(12,'�Ծ�ǿ�');
insert into move values
(13,'�Ƿɱǿ�');
insert into move values
(14,'â��ǿ�');
insert into move values
(15,'��â�ǿ�');
insert into move values
(16,'���رǿ�');
insert into move values
(17,'�о�ǿ�');
insert into move values
(18,'���ǿ�');
insert into move values
(19,'��������ǿ�');
insert into move values
(20,'��ȭ�ǿ�');
insert into move values
(21,'�Ϻαǿ�');
insert into move values
(22,'�ߺαǿ�');
insert into move values
(23,'���αǿ�');
insert into move values
(24,'�����αǿ�');
insert into move values
(25,'���αǿ�');
insert into move values
(26,'�������αǿ�');
insert into move values
(27,'�������αǿ�');
insert into move values
(28,'�����Ϻαǿ�');
insert into move values
(29,'�����Ϻαǿ�');
insert into move values
(30,'�︪�ǿ�');
insert into move values
(31,'����ǿ�');
insert into move values
(32,'���ֱǿ�');
insert into move values
(33,'�����ǿ�');
insert into move values
(34,'�뱸�ǿ�');
insert into move values
(35,'���ֱǿ�');
insert into move values
(36,'���ǿ�');
insert into move values
(37,'���αǿ�');

select * from district;
select * from move;
select * from information;
select i.sn, d.districtName, m.moveName 
from information i, district d, move m 
where (i.districtNo = d.districtNo)
and (i.moveNo = m.moveNo);
