WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('Argentina',
                    'Germany',
                    'UK',
                    'USA')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Argentina:Atp',
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
                    'USA:X'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv series')
  AND rt.role IN ('composer',
                   'costume designer')
  AND n.gender IN ('f')
  AND k.keyword IN ('blood',
                     'father-son-relationship',
                     'fight',
                     'flashback',
                     'gun',
                     'non-fiction');