 #US Household Income Exploratory Data Analysis
 select*
 from us_household_income;
 
 select*
 from us_household_income_statistics;
 
 
select state_name, county, Aland, Awater
from us_project.us_household_income;

#sum of Aland and Awater
select state_name, sum(Aland), sum(Awater)
from us_project.us_household_income
group by state_name
order by 2 desc
limit 10;

#combining tables using join
select u.state_name, county, type, `primary`, mean, median
from us_household_income U
join us_household_income_statistics US
on u.id = us.id
where mean <> 0;

#average household income using mean and median
select u.state_name, round(avg(mean),1), round(avg(median),1)
from us_household_income U
join us_household_income_statistics US
on u.id = us.id
where mean <> 0
group by u.state_name
order by 2 desc
limit 5;


select type,count(type), round(avg(mean),1), round(avg(median),1)
from us_household_income U
join us_household_income_statistics US
on u.id = us.id
where mean <> 0
group by 1
order by 3 desc
limit 20;

select u.state_name, city, round(avg(mean),1)
from us_household_income_statistics U
join us_project. us_household_income US
on u.id = us.id
group by u.state_name, city
order by round(avg(mean),1) desc;
