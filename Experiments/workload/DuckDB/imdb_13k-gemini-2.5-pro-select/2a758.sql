
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('6')
AND mi1.info IN ('Dolby',
                    'Mono',
                    'Stereo')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('1')
AND mi2.info IN ('22',
                    '30',
                    '60',
                    '7',
                    '80',
                    '9',
                    '91',
                    '93',
                    '94',
                    '96',
                    'Argentina:60')
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND n.gender IS NULL
  AND rt.role IN ('production designer');