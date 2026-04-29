 
 WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('writer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND it1.id IN ('6')
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
  AND it2.id IN ('8')
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