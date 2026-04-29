
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.57)',
                   '(#3.33)',
                   '(#3.8)',
                   '(#4.13)',
                   '(#4.34)',
                   'A Bell for Adano',
                   'Blackmail',
                   'Divide and Conquer',
                   'Home Sweet Home',
                   'Kitty',
                   'La chica del gato',
                   'Man of a Thousand Faces',
                   'Parnell',
                   'Second Sight',
                   'The Fighting Devil Dogs',
                   'The Ringer')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Canada:G',
                    'Finland:(Banned)',
                    'France:U',
                    'Iceland:16',
                    'Singapore:PG',
                    'Spain:T',
                    'USA:G',
                    'USA:Not Rated',
                    'USA:R',
                    'USA:Unrated')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'costume designer',
                   'director',
                   'guest',
                   'producer'));