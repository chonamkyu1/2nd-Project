Select count(*) as "CNT" ,CNAME,(sum(CDISPER))/count(*) as "CDISPER", 
       (sum(CDISCASH))/count(*) AS"CDISCASH", (SUM(CVALIDITY))/COUNT(*) AS "CVALIDITY"
from coupon C
group by cname ;

select count(*) as "cnt", cordate
from coupon
group by cordate;