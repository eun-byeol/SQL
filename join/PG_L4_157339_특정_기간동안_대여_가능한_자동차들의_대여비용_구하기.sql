select
    crcc.CAR_ID,
    crcc.CAR_TYPE,
    floor(crcc.DAILY_FEE * 30 * (1 - crcdp.DISCOUNT_RATE/100)) FEE
from CAR_RENTAL_COMPANY_CAR crcc
left join CAR_RENTAL_COMPANY_RENTAL_HISTORY ccrh
    on crcc.CAR_ID = ccrh.CAR_ID
    and ccrh.START_DATE <= '2022-11-30'
    and ccrh.END_DATE >= '2022-11-01'
join CAR_RENTAL_COMPANY_DISCOUNT_PLAN crcdp
    on crcdp.CAR_TYPE = crcc.CAR_TYPE
    and crcdp.DURATION_TYPE like '30일 이상'
where crcc.CAR_TYPE in ('세단', 'SUV')
    and ccrh.HISTORY_ID is NULL
having FEE >= 500000 and FEE < 2000000
order by 3 desc, 2 asc, 1 desc;
