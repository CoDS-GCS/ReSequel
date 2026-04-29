
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'guest',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    'AGA Sound System',
                    'Cinephone',
                    'De Forest Phonofilm',
                    'Dolby Digital',
                    'Mono',
                    'Silent',
                    'Stereo',
                    'Vitaphone')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('MET:',
                    'PFM:16 mm',
                    'PFM:70 mm',
                    'PFM:Video',
                    'RAT:1.36 : 1');