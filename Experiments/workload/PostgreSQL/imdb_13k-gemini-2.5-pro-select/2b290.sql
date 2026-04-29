
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('anal-sex',
                     'bare-chested-male',
                     'death',
                     'doctor',
                     'female-frontal-nudity',
                     'gay',
                     'independent-film',
                     'party',
                     'song')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Mono',
                    'SDDS')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'French',
                    'German',
                    'Hindi')
  AND rt.role IN ('miscellaneous crew',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);