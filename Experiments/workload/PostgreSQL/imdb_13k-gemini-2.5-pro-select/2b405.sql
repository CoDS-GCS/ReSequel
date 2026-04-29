WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('Catalan',
                    'Chinese',
                    'Estonian',
                    'French',
                    'Galician',
                    'Georgian',
                    'Indonesian',
                    'Italian',
                    'Malayalam',
                    'Persian',
                    'Portuguese',
                    'Tamil',
                    'Thai',
                    'Urdu')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color'))
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'writer')
  AND n.gender IN ('m')
  AND k.keyword IN ('evil-cowboy',
                     'forced-to-watch-rape',
                     'overload',
                     'photographic-memory',
                     'placing-a-candle-in-the-hands-of-a-dead-man',
                     'rustling',
                     'satin-robe',
                     'siena-tuscany-italy',
                     'steno-pad',
                     'thalassemia',
                     'white-ankle-socks',
                     'wrist-slitting');