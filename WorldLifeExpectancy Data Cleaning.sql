#world life expectancy (data cleaning)

select*
from world_life_expectancy
;

#identifying duplicates
select Country, Year, concat(country, year), count(concat(Country,year))
from world_life_expectancy
GROUP BY Country, Year, concat(country, year)
having count(concat(Country,year)) > 1;

select*
from (
  select row_id,
  concat(country, year),
  row_number() over(partition by concat(country, year) order by concat(country, year)) as row_num
  from world_life_expectancy
) as row_table
where row_num >1;

delete from world_life_expectancy
where
  row_id in (
  select row_id
from (
  select row_id,
  concat(country, year),
  row_number() over(partition by concat(country, year) order by concat(country, year)) as row_num
  from world_life_expectancy
) as row_table
  world_life_expectancywhere row_num >1
);

select*
from world_life_expectancy
where status = ''
;
#identifying missing data
select DISTINCT(status)
from world_life_expectancy
where status <> '';

select distinct (country)
from world_life_expectancy
where status = 'developing'
;

update world_life_expectancy T1
join world_life_expectancy T2
on T1.country = T2.country
set T1.status = 'developing'
where T1.status = ''
and T2. status <> ''
and T2.status = 'developing'
;

update world_life_expectancy T1
join world_life_expectancy T2
on T1.country = T2.country
set T1.status = 'developed'
where T1.status = ''
and T2. status <> ''
and T2.status = 'developed'
;

select country, year, `life expectancy`
from world_life_expectancy
#where `life expectancy` = ''
;




select T1.country,T1.year, T1.`life expectancy`,
T2.country, T2.year, T2.`life expectancy` ,
T3.country, T3.year, T3. `life expectancy` ,
round((T2.`life expectancy` + T3.`life expectancy`)/2,1)
from world_life_expectancy T1
join world_life_expectancy T2
     on T1.country = T2.country
     and T1.year =T2.year -1
join world_life_expectancy T3
     on T1.country =T3.country
     and T1.year = T3.year +1
where T1.`life expectancy` = ''
;

update world_life_expectancy T1
join world_life_expectancy T2
     on T1.country = T2.country
     and T1.year =T2.year -1
join world_life_expectancy T3
     on T1.country =T3.country
     and T1.year = T3.year +1
set T1.`life expectancy` = round((T2.`life expectancy` + T3.`life expectancy`)/2,1)
where T1.`life expectancy` =''
;

select*
from world_life_expectancy
#where `life expectancy` =''
;



