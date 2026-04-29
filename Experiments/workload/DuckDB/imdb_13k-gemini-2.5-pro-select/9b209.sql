WITH filtered_mi1 AS
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('6',
                  '8')
     AND info IN ('70 mm 6-Track',
                    'Bulgaria',
                    'Colombia',
                    'Cuba',
                    'Czechoslovakia',
                    'Dolby Stereo',
                    'Ecuador',
                    'Egypt',
                    'Finland',
                    'Indonesia',
                    'Poland',
                    'Puerto Rico',
                    'Slovakia',
                    'Sonics-DDP',
                    'South Korea',
                    'Uruguay',
                    'Venezuela'))
SELECT fmi1.info,
       n.name,
       COUNT(*)
FROM filtered_mi1 AS fmi1
JOIN title AS t ON fmi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON fmi1.movie_id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
  AND rt.role IN ('costume designer',
                   'director',
                   'producer')
  AND n.name ILIKE '%bri%'
  AND pi.info_type_id IN ('24')
GROUP BY fmi1.info,
         n.name;