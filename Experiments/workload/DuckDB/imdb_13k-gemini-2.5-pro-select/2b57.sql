WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
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
                    'PFM:35 mm',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('102',
                    '105',
                    '120',
                    '88',
                    '90',
                    '95',
                    '98')
  AND n.gender IN ('f')
  AND rt.role IN ('producer')
  AND k.keyword IN ('based-on-novel',
                     'family-relationships',
                     'fight',
                     'flashback',
                     'homosexual',
                     'independent-film',
                     'kidnapping',
                     'lesbian',
                     'male-nudity',
                     'murder',
                     'non-fiction',
                     'oral-sex',
                     'revenge',
                     'singer',
                     'suicide');