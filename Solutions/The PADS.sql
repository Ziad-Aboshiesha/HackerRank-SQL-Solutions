SELECT 
    CONCAT(Name, '(', SUBSTRING(Occupation, 1, 1), ')') 
FROM 
    OCCUPATIONS 
ORDER BY 
    Name;

SELECT 
    CONCAT('There are a total of ', COUNT(Occupation), ' doctors.') 
FROM 
    OCCUPATIONS 
WHERE 
    Occupation = 'doctor';

SELECT 
    CONCAT('There are a total of ', COUNT(Occupation), ' actors.') 
FROM 
    OCCUPATIONS 
WHERE 
    Occupation = 'actor';

SELECT 
    CONCAT('There are a total of ', COUNT(Occupation), ' singers.') 
FROM 
    OCCUPATIONS 
WHERE 
    Occupation = 'singer';

SELECT 
    CONCAT('There are a total of ', COUNT(Occupation), ' professors.') 
FROM 
    OCCUPATIONS 
WHERE 
    Occupation = 'professor';

SELECT 
    CONCAT(Name, '(', SUBSTRING(Occupation, 1, 1), ')') 
FROM 
    OCCUPATIONS 
ORDER BY 
    Name;

SELECT 
    CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.') 
FROM 
    OCCUPATIONS 
GROUP BY 
    Occupation 
ORDER BY 
    COUNT(Occupation);