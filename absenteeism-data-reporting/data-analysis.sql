create database dataset;
use dataset;

-- join the tables
select * from absenteeism a 
left join compensation c on a.ID = c.ID
left join reasons r on a.Reason_for_absence = r.Number;

-- find the healthiest employees for the bonus
select * from absenteeism
where Social_drinker = 0 and 
Social_smoker = 0 and 
Body_mass_index < 25 and 
absenteeism_time_in_hours < (select avg(absenteeism_time_in_hours) from absenteeism);

-- non-smokers compensation rate increase, 0.68 increase on an hour (1,414.4 per year)     
select count(*) as Non_Smokers from absenteeism where Social_smoker = 0;

select a.ID as ID, Reason as Reason, Month_of_absence,
Body_mass_index as BMI,
(case when Body_mass_index < 18.5 then 'Underweight'
when Body_mass_index between 18.5 and 25 then 'Healthy Weight' 
when Body_mass_index between 25 and 30 then 'Over Weight'
when Body_mass_index > 30 then 'Obese'
else 'Unknown' end) as BMI_Category, 
(case when month_of_absence in (12, 1, 2) then 'Winter'
when month_of_absence in (3, 4, 5) then 'Spring'
when month_of_absence in (6, 7, 8) then 'Summer'
when month_of_absence in (9, 10, 11) then 'Fall' 
else 'Unknown' end) as Season,
Month_of_absence,
Day_of_the_week,
Seasons,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age
from absenteeism a 
left join compensation c on a.ID = c.ID
left join reasons r on a.Reason_for_absence = r.Number;