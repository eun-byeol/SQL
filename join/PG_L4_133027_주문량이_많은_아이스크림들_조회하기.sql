select FLAVOR
from (
        select *
        from FIRST_HALF
        union
        select *
        from JULY
    ) hj
group by hj.FLAVOR
order by sum(hj.TOTAL_ORDER) desc
limit 3;
