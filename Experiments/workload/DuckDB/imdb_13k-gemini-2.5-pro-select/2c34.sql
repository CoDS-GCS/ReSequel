
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
  AND t.title IN ('(#1.59)',
                   '(#4.33)',
                   'Anna proletárka',
                   'Cinderella',
                   'Erster Teil',
                   'Law and Order',
                   'Love and Marriage',
                   'Red, Hot and Blue',
                   'The Big Broadcast of 1936',
                   'The Inheritance',
                   'The Lost City',
                   'Topaze')
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:Metrocolor',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'LAB:Technicolor',
                    'MET:300 m',
                    'PCS:Panavision',
                    'RAT:1.78 : 1',
                    'RAT:2.00 : 1',
                    'RAT:4:3')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Australia:G',
                    'Singapore:PG',
                    'South Korea:15',
                    'UK:18',
                    'UK:U',
                    'USA:X',
                    'West Germany:6')
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
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'writer'));