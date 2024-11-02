select p.PRODUCT_ID, p.PRODUCT_NAME, (sum(o.amount) * p.PRICE) TOTAL_SALES
from FOOD_PRODUCT p
join FOOD_ORDER o
    on p.PRODUCT_ID = o.PRODUCT_ID
    and month(o.PRODUCE_DATE between '2022-05-01' and '2022-05-31'
group by p.PRODUCT_ID
order by 3 desc, 1;
