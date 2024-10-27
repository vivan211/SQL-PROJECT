# US Household income data cleaning
SELECT *
 FROM us_project.us_household_income;


SELECT *
 FROM us_project.us_household_income_statistics;
 alter table us_project.us_household_income_statistics rename column `ï»¿id` to `id`;
 
 SELECT count(id)
 FROM us_project.us_household_income_statistics;
 
 SELECT *
 FROM us_project.us_household_income;
 
 #identifying duplicates
 
 select id, count(id)
 from us_project.us_household_income
 group by id
 having count(id) >1;
 
 
 
 select *
 from (
 select row_id,
 id,
 row_number() over(partition by id order by id) as row_num
 from us_project.us_household_income) duplicates
 where row_num > 1;
 
delete from us_household_income
where row_id in (
select row_id
 from (
 select row_id,
 id,
 row_number() over(partition by id order by id) as row_num
 from us_project.us_household_income) duplicates
 where row_num > 1);
 
 select state_name, count(State_Name)
 from us_project.us_household_income
 group by State_Name
 ;
 
 update us_project.us_household_income
 set state_name = 'Georgia'
 where state_name = 'georia'
 ;
 
  update us_project.us_household_income
 set state_name = 'Alabama'
 where state_name = 'alabama'
 ;
 
 select *
 from us_project.us_household_income
 where county = 'Autauga county'
 order by 1;
 
 update us_household_income
 set place ='Autaugaville'
 where county = 'Autauga county'
 and city = 'Vinemont';
 
 select type, count(type)
 from us_household_income
 group by type
 order by 1;
 
 update us_household_income
 set type ='Borough'
 where type = 'Boroughs';
 
 
