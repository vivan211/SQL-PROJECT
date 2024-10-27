#Exploratory Data Analysis
select country,
 min(`life expectancy`), 
 max(`life expectancy`),
  round(max(`life expectancy`) -min(`life expectancy`),1) as life_increase_15_years
from world_life_expectancy
GROUP BY country
having  min(`life expectancy`) <> 0
and max(`life expectancy`) <> 0
order by life_increase_15_years desc
;

#average life expectancy for each year
 
 SELECT year, round(avg(`life expectancy`),2)
 from world_life_expectancy
 group by year
 order by year
 ;
 
 
 #correlation between life expectancy and GDP
 
 select country, round(avg(`life expectancy`),1) as life_exp, round(avg(GDP),1) as gdp
 from world_life_expectancy
 group by country
 having life_exp >0
 and gdp >0
 order by gdp asc
 ;
 
 select country, round(avg(`life expectancy`),1) as life, round(avg(`adult mortality`),1) as adults
 from world_life_expectancy
 GROUP BY country
 having life >0
 and adults >0
 order by country 
 ;
 
 select country,
 year,
 `life expectancy`,
 `adult mortality`,
 sum(`adult mortality`) over(PARTITION BY country order by year) as rolling_total
 from world_life_expectancy
 ;
 
#Average life expectancy Between status , developing and develop
select status, round(avg(`life expectancy`),1)
from world_life_expectancy
group by status
;

select status,  count(distinct country), round(avg(`life expectancy`),1)
from world_life_expectancy
group by status
;

