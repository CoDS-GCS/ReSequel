WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer',
                   'costume designer',
                   'director'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('16')
  AND mi1.info IN ('USA:1993',
                    'USA:2010',
                    'USA:2011',
                    'USA:April 2011',
                    'USA:August 2010',
                    'USA:January 2010',
                    'USA:October 2006')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('119',
                    '157',
                    '178',
                    'Canada:85',
                    'Canada:97',
                    'France:91',
                    'Germany:86',
                    'Germany:94',
                    'Italy:95',
                    'Spain:100',
                    'USA:42',
                    'USA:43',
                    'USA:67',
                    'USA:81',
                    'USA:86');