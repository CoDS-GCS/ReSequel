WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('tv movie',
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
     WHERE ROLE IN ('cinematographer',
                   'costume designer',
                   'miscellaneous crew',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('16')
  AND mi1.info IN ('Finland:1989',
                    'France:September 2001',
                    'Germany:February 2004',
                    'Germany:February 2005',
                    'Peru:1987',
                    'Peru:1988',
                    'Portugal:February 1990')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:PG',
                    'Canada:PG',
                    'Germany:BPjM Restricted',
                    'Iceland:16',
                    'Ireland:18',
                    'Ireland:G',
                    'Japan:G',
                    'Mexico:C',
                    'Netherlands:18',
                    'Norway:12',
                    'Singapore:(Banned)',
                    'UK:U',
                    'West Germany:18',
                    'West Germany:6',
                    'West Germany:o.Al.');