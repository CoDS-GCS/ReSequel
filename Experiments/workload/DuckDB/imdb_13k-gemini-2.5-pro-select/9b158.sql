WITH filtered_movies AS
  (SELECT t.id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND mi1.info_type_id IN ('6',
                  '8')
     AND mi1.info IN ('70 mm 6-Track',
                    'Austria',
                    'Bolivia',
                    'Chile',
                    'China',
                    'DTS-ES',
                    'Datasat',
                    'Dominican Republic',
                    'East Germany',
                    'Ecuador',
                    'Hong Kong',
                    'India',
                    'Luxembourg',
                    'Norway',
                    'Panama',
                    'Peru',
                    'Poland',
                    'Puerto Rico',
                    'Ultra Stereo'))
SELECT fm.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%carl%'
  AND pi.info_type_id IN ('29')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer')
GROUP BY fm.info,
         n.name;