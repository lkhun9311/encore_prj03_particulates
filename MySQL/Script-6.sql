select * from result6;
-- 6번. 2021년 지역단위 시간별 미세먼지 경보 발령 현황
create table result6
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "서울")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "경기")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "인천")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "세종")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "충북")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "충남")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "대전")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "전북")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "전남")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "광주")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "대구")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "경북")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "경남")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "울산")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "부산")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "강원")
group by i.issueTime
union
select i.districtNo, d.districtName, i.issueTime, count(case when i.itemCode="PM2.5" then 1 end) as "PM2.5", count(case when i.itemCode="PM10" then 1 end) as "PM10", count(*) "Sum"
from information i, district d
where (i.districtNo = d.districtNo)
and (d.districtName = "제주")
group by i.issueTime
order by districtNo, issueTime;