select o.animal_id, o.animal_type, o.name
from animal_ins i
join animal_outs o
    on i.animal_id = o.animal_id
where i.sex_upon_intake like 'Intact%'
and regexp_like(sex_upon_outcome, 'Neutered|Spayed')
# and (o.sex_upon_outcome like 'Neutered%' or o.sex_upon_outcome like 'Spayed%')
# and o.sex_upon_outcome not like 'Intact%'
;
