.headers on
.mode column

-- take first two characters, case insensitive, sort them, uniq them 

SELECT DISTINCT 
    count( upper(substr(Name, 0,3)) )
FROM
    artists
ORDER BY Name desc;

