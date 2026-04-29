
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series'))
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'Germany',
                    'UK',
                    'USA')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Australia:PG',
                    'Canada:13+',
                    'Germany:12',
                    'Germany:18',
                    'Iceland:12',
                    'Netherlands:12',
                    'Netherlands:AL',
                    'Spain:13',
                    'USA:PG',
                    'USA:TV-14',
                    'USA:X')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'costume designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('blood',
                     'father-son-relationship',
                     'fight',
                     'flashback',
                     'gun',
                     'non-fiction'));