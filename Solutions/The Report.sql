SELECT 
    S.Name, 
    G.GRADE, 
    S.Marks 
FROM 
    Students AS S 
INNER JOIN 
    Grades AS G 
ON 
    S.Marks >= G.Min_Mark 
    AND S.Marks <= G.Max_Mark 
WHERE 
    G.GRADE >= 8 
ORDER BY 
    G.GRADE DESC, 
    S.Name;

SELECT 
    NULL, 
    G.GRADE, 
    S.Marks 
FROM 
    Students AS S 
INNER JOIN 
    Grades AS G 
ON 
    S.Marks >= G.Min_Mark 
    AND S.Marks <= G.Max_Mark 
WHERE 
    G.GRADE < 8 
ORDER BY 
    G.GRADE DESC, 
    S.Marks;