WITH filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('3')
     AND mi2.info IN ('Biography',
                    'Crime',
                    'Drama',
                    'Fantasy',
                    'Game-Show',
                    'Horror',
                    'War'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_mi1 ON t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON t.id = filtered_mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.114)',
                   '(#1.91)',
                   '(#1.93)',
                   '(#5.21)',
                   'Confession',
                   'Daddy Long Legs',
                   'Delayed Action',
                   'Der Hauptmann von Köpenick',
                   'Die Fledermaus',
                   'Dilemma',
                   'Down on the Farm',
                   'Escapade',
                   'Finale',
                   'Haunted House',
                   'Key to the City',
                   'Like Father, Like Son',
                   'Lilith',
                   'One Sunday Afternoon',
                   'Retribution',
                   'Ricochet',
                   'Scene of the Crime',
                   'Sea Devils',
                   'The Frame-Up',
                   'The Great Gatsby',
                   'The Light That Failed',
                   'The Mask',
                   'The Mighty Barnum',
                   'The Plainsman',
                   'The Prisoner',
                   'The Replacement',
                   'The Sacrifice',
                   'Titanic',
                   'Uncle Toms Cabin')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'producer')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie');