
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('Nigeria:2007',
                    'USA:1994',
                    'USA:1997',
                    'USA:1998',
                    'USA:1999',
                    'USA:2001',
                    'USA:2008',
                    'USA:2010',
                    'USA:2013',
                    'USA:April 2009');