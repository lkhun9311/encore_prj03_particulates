select * from result3;
-- 3번. 2021년 전국단위 시간별 미세먼지 경보 발령 현황 
create table result3
select i.issueTime, count(i.issueTime) "Sum"
from information i
group by i.issueTime
order by i.issueTime;