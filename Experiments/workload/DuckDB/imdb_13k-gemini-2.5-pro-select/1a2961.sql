
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'guest'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('Nigeria:2006',
                    'USA:1994',
                    'USA:1996',
                    'USA:1998',
                    'USA:1999',
                    'USA:2003',
                    'USA:2004',
                    'USA:2006',
                    'USA:2007',
                    'USA:2009',
                    'USA:2010',
                    'USA:2011',
                    'USA:2013',
                    'USA:April 2009');