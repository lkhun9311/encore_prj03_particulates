select * from result3;
-- 3��. 2021�� �������� �ð��� �̼����� �溸 �߷� ��Ȳ 
create table result3
select i.issueTime, count(i.issueTime) "Sum"
from information i
group by i.issueTime
order by i.issueTime;