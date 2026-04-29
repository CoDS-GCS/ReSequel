WITH filtered_mi AS
  (SELECT movie_id
   FROM movie_info mi
   JOIN info_type it ON mi.info_type_id = it.id
   WHERE (it.id IN ('7')
          AND mi.info IN ('CAM:Arriflex Cameras and Lenses',
                    'CAM:Lenses and Panaflex Cameras by Panavision',
                    'LAB:Laboratoires LTC, St. Cloud, France',
                    'LAB:Technicolor',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:Film',
                    'PFM:8 mm',
                    'RAT:1.75 : 1'))
     OR (it.id IN ('17')
         AND mi.info IN ('Last show of the series.'))
   GROUP BY movie_id
   HAVING COUNT(DISTINCT CASE
                             WHEN it.id IN ('7') THEN 1
                             ELSE 2
                         END) = 2)
SELECT COUNT(*)
FROM title t
JOIN kind_type kt ON t.kind_id = kt.id
JOIN cast_info ci ON t.id = ci.movie_id
JOIN name n ON ci.person_id = n.id
JOIN role_type rt ON ci.role_id = rt.id
JOIN filtered_mi ON t.id = filtered_mi.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie')
  AND n.gender IS NULL
  AND rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'writer');