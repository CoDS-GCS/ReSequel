WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('tv movie',
                   'tv series'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('5')
  AND mi1.info IN ('Australia:PG',
                    'Canada:PG',
                    'Netherlands:12',
                    'Netherlands:16',
                    'Singapore:NC-16',
                    'South Korea:15',
                    'Sweden:15')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND n.gender IN ('m')
  AND rt.role IN ('producer')
  AND k.keyword IN ('back-from-the-dead',
                     'code-enforcement',
                     'delusion-of-invisibility',
                     'oversized-tennis-ball',
                     'reference-to-havana-film-festival',
                     'shropshire-england');