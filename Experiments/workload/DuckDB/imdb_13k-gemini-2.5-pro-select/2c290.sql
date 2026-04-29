
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.1078)',
                   '(#1.132)',
                   '(#1.174)',
                   '(#1.246)',
                   '(#1.452)',
                   '(#1.47)',
                   '(#1.562)',
                   '(#1.593)',
                   '(#1.595)',
                   '(#1.646)',
                   '(#1.656)',
                   '(#1.875)',
                   '(#2.10)',
                   '(#2.14)',
                   '(#7.23)',
                   '(#9.9)',
                   'A Taste of Money',
                   'Beauty and the Beast',
                   'Beware: Children at Play',
                   'Bloodlines',
                   'Cold Comfort',
                   'Evacuation',
                   'Hideout',
                   'Hit and Run',
                   'Hollywood My Home Town',
                   'Insaaf',
                   'Justice',
                   'Lady Luck',
                   'Lily Tomlin',
                   'Los chicos de la guerra',
                   'Marriage',
                   'Mississippi Burning',
                   'Mixed Doubles',
                   'Murder Rap',
                   'Osa 2',
                   'Palm Springs Weekend',
                   'Robert Kennedy & His Times',
                   'Section spéciale',
                   'Skin',
                   'Starman',
                   'Starting Out',
                   'The Adventures of Ford Fairlane',
                   'The Crossing',
                   'The Lesson',
                   'Werther',
                   'Where Theres a Will',
                   'Wolf')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi1.info IN ('China',
                    'Hungary',
                    'Romania',
                    'South Africa',
                    'South Korea',
                    'Switzerland',
                    'West Germany')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'History',
                    'Music',
                    'Romance',
                    'Thriller');