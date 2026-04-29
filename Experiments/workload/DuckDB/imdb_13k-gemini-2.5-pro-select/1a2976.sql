
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
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'director'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('117',
                    '67',
                    '72',
                    'Argentina:89',
                    'Argentina:92',
                    'UK:195',
                    'UK:8',
                    'UK:92',
                    'USA:133')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:1997',
                    'USA:1998',
                    'USA:1999',
                    'USA:2001',
                    'USA:2002',
                    'USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2006',
                    'USA:2012',
                    'USA:April 2009');