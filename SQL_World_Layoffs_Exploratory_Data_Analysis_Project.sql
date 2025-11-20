-- Exploratory Data Anaylsis Project

-- 1) Identify top 5 companies with the highest number of layoffs in each year.

Select *
From layoff_staging_3 ;

Select company, year(`date`), sum(total_laid_off)
From layoff_staging_3
Group by company, year(`date`)
Order by 3 desc;

With Company_Year (Company, Years, Total_laid_off) as 
(
Select company, year(`date`), sum(total_laid_off)
From layoff_staging_3
Group by company, year(`date`) 
),

Company_Year_ranking as 
(
Select * , dense_rank () over (partition by Years order by Total_laid_off desc) as Ranking
From Company_Year 
Where Years is not Null
 )
 
Select * 
From Company_Year_ranking
where Ranking <= 5 
Order by `Years` Desc ;

-- 2) Find month-to-month layoff patterns with a rolling total laid offs column. 

Select substring(`date`, 1,7) as month, sum(total_laid_off)
From layoff_staging_3 
where substring(`date`, 1,7) is not null
Group by substring(`date`, 1,7)
order by 1 asc; 

With Rolling_total as
(Select substring(`date`, 1,7) as month, sum(total_laid_off) as Total_laid_off
From layoff_staging_3 
where substring(`date`, 1,7) is not null
Group by substring(`date`, 1,7)
order by 1 asc
)
Select `month`, Total_laid_off, sum(Total_laid_off) over (order by `month`) as Rolling_total
from Rolling_total ;





