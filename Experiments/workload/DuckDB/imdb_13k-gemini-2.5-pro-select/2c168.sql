
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND t.title IN ('(#1.1)',
                   '(#1.18)',
                   '(#1.71)',
                   '(#1.93)',
                   '(#3.20)',
                   '(#3.7)',
                   '(#4.27)',
                   '(#4.35)',
                   '(#6.4)',
                   'Anna Karenina',
                   'Backfire',
                   'Du Barry Was a Lady',
                   'Exposed',
                   'French Leave',
                   'Il giorno più corto',
                   'Jailhouse Rock',
                   'Le fantôme de la liberté',
                   'Madame Sans-Gêne',
                   'No Place to Hide',
                   'Pursuit',
                   'The Dinner Party',
                   'The Fight',
                   'The Great Gatsby',
                   'The Message',
                   'The Talk of the Town',
                   'The Unknown',
                   'Threes a Crowd',
                   'Twelfth Night',
                   'Wake Island')
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Arabic',
                    'Bengali',
                    'Danish',
                    'Filipino',
                    'French',
                    'German',
                    'Hungarian',
                    'Korean',
                    'Russian',
                    'Serbo-Croatian',
                    'Spanish',
                    'Telugu',
                    'Turkish')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'editor',
                   'producer'));