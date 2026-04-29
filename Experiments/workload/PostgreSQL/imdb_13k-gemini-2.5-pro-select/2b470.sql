WITH ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('actress')
     AND n.gender IN ('m'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('8')
  AND mi1.info IN ('Canada',
                    'East Germany',
                    'France',
                    'Italy',
                    'Japan',
                    'UK',
                    'USA')
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND k.keyword IN ('bare-breasts',
                     'blood',
                     'family-relationships',
                     'father-son-relationship',
                     'friendship',
                     'hospital',
                     'independent-film',
                     'interview',
                     'jealousy',
                     'kidnapping',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'number-in-title',
                     'one-word-title',
                     'party',
                     'revenge',
                     'sex',
                     'song',
                     'suicide',
                     'violence');