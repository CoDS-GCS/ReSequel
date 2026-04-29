WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('103')
  AND mi1.info IN ('Warner Bros. Entertainment Inc.')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Mono',
                    'SDDS',
                    'Silent',
                    'Stereo');