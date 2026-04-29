WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'RAT:2.35 : 1')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('France:U',
                    'Germany:o.Al.',
                    'New Zealand:R18',
                    'Portugal:M/16',
                    'Spain:13',
                    'Switzerland:7',
                    'USA:G',
                    'USA:PG'))
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
  AND kt.kind IN ('tv series',
                   'video game')
  AND rt.role IN ('costume designer')
  AND n.gender IN ('f',
                    'm')
  AND k.keyword IN ('bare-breasts',
                     'character-name-in-title',
                     'female-nudity',
                     'hospital',
                     'mother-daughter-relationship',
                     'number-in-title');