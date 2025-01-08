SELECT 
    H.hacker_id, 
    H.name 
FROM 
    Hackers AS H 
INNER JOIN 
    Submissions AS S 
ON 
    H.hacker_id = S.hacker_id 
INNER JOIN 
    Challenges AS C 
ON 
    C.challenge_id = S.challenge_id 
INNER JOIN 
    Difficulty AS D 
ON 
    C.difficulty_level = D.difficulty_level 
WHERE 
    D.score = S.score 
GROUP BY 
    H.name, 
    H.hacker_id 
HAVING 
    COUNT(H.name) >= 2 
ORDER BY 
    COUNT(H.name) DESC, 
    H.hacker_id;