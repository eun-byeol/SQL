select d.id, d.email, d.first_name, d.last_name
from developers d
where d.skill_code & (
    select sum(code)
    from skillcodes
    where category like 'Front End'
    group by category
)
order by 1;
