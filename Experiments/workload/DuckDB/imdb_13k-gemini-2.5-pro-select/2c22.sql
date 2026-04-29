WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1925
     AND t.title IN ('(#1.1)',
                   '(#1.114)',
                   '(#1.44)',
                   '(#1.87)',
                   '(#8.9)',
                   'A-Haunting We Will Go',
                   'Breakthrough',
                   'Daddy Long Legs',
                   'Dinner at Eight',
                   'Faces',
                   'King Lear',
                   'Kismet',
                   'Stage Struck',
                   'The Avenger',
                   'The Boss',
                   'The Edge of Night',
                   'The Grapes of Wrath',
                   'The Last Hurrah',
                   'The Lemon Drop Kid',
                   'Time Out of Mind',
                   'Zweiter Teil')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND rt.role IN ('costume designer',
                   'director')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('3')
     AND mi1.info IN ('Action',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'History',
                    'Horror',
                    'Music',
                    'Mystery',
                    'Sci-Fi',
                    'Short',
                    'Sport'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');