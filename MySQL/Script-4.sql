select * from result4;
-- 4��. 2021�� �������� ���� �̼����� �溸 �߷� ��Ȳ
create table result4
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "��õ")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�泲")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�뱸")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�泲")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�λ�")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth
union
select i.districtNo, d.districtName, i.issueMonth, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueMonth;