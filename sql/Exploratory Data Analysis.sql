-- Exploratory Data Analysis

-- Taking a look at the data and what business questions we can answer
SELECT *
FROM layoffs_staging2;

-- What is the range of time that this data covers?
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- What industry had the most layoffs?
SELECT industry, SUM(total_laid_off) AS max_layoffs
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- What company had raised the most amount of money and what was their corresponding industry?
SELECT company, industry, SUM(funds_raised_millions) AS max_funds_raised_millions
FROM layoffs_staging2
GROUP BY company, industry
ORDER BY 3 DESC
LIMIT 5;

-- Give me the amount of layoffs categorized month by month.
SELECT DATE_FORMAT(`date`, '%Y-%m') AS `MONTH`, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- Give me the rolling total of the layoffs month by month.
WITH rolling_total AS (
SELECT DATE_FORMAT(`date`, '%Y-%m') AS `MONTH`, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_layoffs, SUM(total_layoffs) OVER(ORDER BY `MONTH`) AS rolling_total
FROM rolling_total;

-- For each year, give me the top 5 companies and their respective industries that had the highest amount of layoffs.
WITH company_year (company, industry, years, total_laid_off) AS
(
SELECT company, industry, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, industry, YEAR(`date`)
), company_year_rank AS
(
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE ranking <=5;

-- Which companies maximized profit while keeping layoffs low?
WITH company_stats AS (
  SELECT 
    company,
    industry,
    SUM(funds_raised_millions) AS total_funds,
    SUM(total_laid_off) AS total_layoffs
  FROM layoffs_staging2
  WHERE total_laid_off IS NOT NULL AND funds_raised_millions IS NOT NULL
  GROUP BY company, industry
),
ranked AS (
  SELECT *,
    RANK() OVER (ORDER BY total_funds DESC) AS funds_rank,
    RANK() OVER (ORDER BY total_layoffs ASC) AS layoffs_rank
  FROM company_stats
)
SELECT *
FROM ranked
ORDER BY (funds_rank * 0.7 + layoffs_rank * 0.3);