
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
  AND t.title IN ('(#1.100)',
                   '(#1.50)',
                   '(#1.79)',
                   '(#1.86)',
                   '(#1.99)',
                   '(#4.15)',
                   '(#4.3)',
                   '(#5.23)',
                   '(#5.24)',
                   '(#6.17)',
                   '(#6.3)',
                   '(#8.4)',
                   'California',
                   'Der Hexer',
                   'Dream Girl',
                   'Dritter Teil',
                   'Emilia Galotti',
                   'Girl Crazy',
                   'Il giorno più corto',
                   'Kdyby tisíc klarinetu',
                   'Lady in the Dark',
                   'Mayerling',
                   'Richard III',
                   'Stage Door',
                   'Stagecoach',
                   'The Breaking Point',
                   'The Life of the Party',
                   'The Shakedown',
                   'The Widow',
                   'Whiplash',
                   'World of Sport',
                   'You Came Along')
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Argentina:18',
                    'Australia:M',
                    'France:U',
                    'Germany:12',
                    'Sweden:Btl',
                    'UK:U',
                    'USA:Not Rated',
                    'USA:Passed')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
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
     WHERE ROLE IN ('actress',
                   'costume designer',
                   'guest',
                   'producer'));