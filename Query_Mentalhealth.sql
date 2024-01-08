-- Retrieve all columns from the students_health table
SELECT * 
FROM students_health;

-- Count the total number of records in the students_health table
SELECT COUNT(*) AS total_records 
FROM students_health;

-- Count occurrences of international and domestic student values in the students_health table
SELECT inter_dom, COUNT(*) AS count_inter_dom 
from students_health GROUP BY inter_dom ;

-- Retrieve rows where inter_dom does not start with 'I' or 'D' or is NULL
SELECT * 
FROM students_health
WHERE inter_dom NOT LIKE 'I%' AND inter_dom NOT LIKE 'D%' OR inter_dom IS NULL;

-- Calculate summary statistics for todep, tosc, and toas columns
SELECT 
MIN(todep) AS min_phq,
MAX(todep) AS max_phq,
ROUND(AVG(todep),2) AS avg_phq,
MIN(tosc) AS min_scs,
MAX(tosc) AS max_scs,
ROUND(AVG(tosc),2) AS avg_scs,
MIN(toas) AS min_as,
MAX(toas) AS max_as,
ROUND(AVG(toas),2) AS avg_as
FROM students_health

-- Calculate summary statistics for todep, tosc, and toas columns where inter_dom is 'Inter'
SELECT 
MIN(todep) AS min_phq,
MAX(todep) AS max_phq,
ROUND(AVG(todep),2) AS avg_phq,
MIN(tosc) AS min_scs,
MAX(tosc) AS max_scs,
ROUND(AVG(tosc),2) AS avg_scs,
MIN(toas) AS min_as,
MAX(toas) AS max_as,
ROUND(AVG(toas),2) AS avg_as
FROM students_health
WHERE inter_dom LIKE 'Inter'

-- Calculate average values for todep, tosc, and toas columns grouped by stay, where inter_dom is 'Inter'
SELECT stay,
ROUND(AVG(todep),2) AS average_phq,
ROUND(AVG(tosc),2) AS average_scs,
ROUND(AVG(toas),2) AS average_as
FROM students_health
WHERE inter_dom LIKE 'Inter'
GROUP BY stay
ORDER BY stay DESC;
