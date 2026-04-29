WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'RAT:2.35 : 1')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('France:U',
                    'Germany:o.Al.',
                    'New Zealand:R18',
                    'Portugal:M/16',
                    'Spain:13',
                    'Switzerland:7',
                    'USA:G',
                    'USA:PG')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('costume designer')
  AND k.keyword IN ('bare-breasts',
                     'character-name-in-title',
                     'female-nudity',
                     'hospital',
                     'mother-daughter-relationship',
                     'number-in-title');