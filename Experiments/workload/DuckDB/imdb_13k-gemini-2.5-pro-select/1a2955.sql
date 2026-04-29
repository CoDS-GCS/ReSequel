
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
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Stereo')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Australia:G',
                    'Finland:(Banned)',
                    'Finland:S',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:L',
                    'Singapore:PG',
                    'Sweden:Btl',
                    'UK:15',
                    'UK:X',
                    'USA:Not Rated',
                    'USA:PG',
                    'USA:TV-PG')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'producer',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);