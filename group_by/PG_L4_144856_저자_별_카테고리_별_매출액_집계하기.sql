select b.author_id, a.author_name, b.category, sum(bs.sales * b.price) total_sales 
from book b
join author a
    on b.author_id = a.author_id
join book_sales bs
    on bs.book_id = b.book_id
    and bs.sales_date between '2022-01-01' and '2022-01-31'
group by b.author_id, b.category
order by 1, 3 desc;
