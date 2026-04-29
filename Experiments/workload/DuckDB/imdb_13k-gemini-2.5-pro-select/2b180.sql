WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'character-name-in-title',
                     'death',
                     'doctor',
                     'friendship',
                     'gun',
                     'hardcore',
                     'husband-wife-relationship',
                     'independent-film',
                     'kidnapping',
                     'lesbian-sex',
                     'marriage',
                     'police',
                     'revenge',
                     'sex',
                     'suicide',
                     'surrealism',
                     'violence'))
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('4')
  AND mi1.info IN ('French',
                    'German',
                    'Italian',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Spanish')
  AND it2.id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Mono')
  AND rt.role IN ('director')
  AND n.gender IN ('f');