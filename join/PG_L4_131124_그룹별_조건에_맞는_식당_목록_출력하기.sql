select member_name, review_text, left(review_date, 10) review_date
from member_profile m
join rest_review r
on r.member_id = m.member_id
where m.member_id = (
    select member_id
    from rest_review
    group by member_id
    order by count(*) desc
    limit 1
)
order by 3, 2;
