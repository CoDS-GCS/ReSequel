WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bank-of-china',
                     'blancmange',
                     'british-monarch',
                     'character-says-i-love-you-and-i-always-will',
                     'creole',
                     'demolition-crew',
                     'disguised-as-horse',
                     'gay-activist-alliance',
                     'hall-of-records',
                     'hokianga',
                     'horn-rimmed-glasses',
                     'jungle-fighting',
                     'monkey-king',
                     'night-air-attack',
                     'nude-body',
                     'raggedy-ann',
                     'repressed-desire',
                     'shock-therapy',
                     'wagner-ride-of-the-valkyries'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('LAB:DeLuxe',
                    'MET:600 m',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'Japanese',
                    'Spanish')
  AND rt.role IN ('actor')
  AND n.gender IN ('m');