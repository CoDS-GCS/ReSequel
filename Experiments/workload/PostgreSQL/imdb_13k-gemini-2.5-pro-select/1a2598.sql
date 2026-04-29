 
 WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
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