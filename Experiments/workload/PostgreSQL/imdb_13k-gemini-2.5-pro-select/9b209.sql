WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%bri%'
     AND pi.info_type_id IN ('24')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('6',
                  '8')
  AND mi1.info IN ('70 mm 6-Track',
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
                    'Venezuela')
  AND rt.role IN ('costume designer',
                   'director',
                   'producer')
GROUP BY mi1.info,
         fp.name;