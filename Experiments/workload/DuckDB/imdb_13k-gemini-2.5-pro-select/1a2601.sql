
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('70 mm 6-Track',
                    'DTS',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Silent',
                    'Stereo')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Denmark',
                    'Germany',
                    'Ireland',
                    'Italy',
                    'Netherlands',
                    'Poland',
                    'Russia',
                    'South Korea',
                    'Soviet Union',
                    'Switzerland',
                    'Taiwan',
                    'UK',
                    'West Germany',
                    'Yugoslavia');