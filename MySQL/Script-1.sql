select * from result1;
-- 1��. 2021�� �������� ���� �̼����� �溸 �߷� ��Ȳ 
create table result1
select i.issueMonth "Month", count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i
group by i.issueMonth
order by i.issueMonth;
