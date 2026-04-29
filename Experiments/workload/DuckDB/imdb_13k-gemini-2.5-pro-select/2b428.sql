
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                   'video game')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
AND k.keyword IN ('biography-filmmaking',
                     'invisible-monster',
                     'partition',
                     'reference-to--cleombrotus',
                     'reference-to-nell-gwyn',
                     'reference-to-the-ritz-brothers',
                     'woman-surgeon')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('7')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('6')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director',
                   'editor')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('m')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo');