select * from result6;
-- 6��. 2021�� �������� �ð��� �̼����� �溸 �߷� ��Ȳ
create table result6
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "��õ")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�泲")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�뱸")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�泲")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "���")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "�λ�")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "����")
group by i.issueTime
order by districtNo, issueTime;