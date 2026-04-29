
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND t.title IN ('(#1.27)',
                   '(#1.2828)',
                   '(#6.152)',
                   '(2002-05-20)',
                   '(2011-11-09)',
                   'Fashion One Correspondent Search London',
                   'Finale: Part 2',
                   'Fix My Friend',
                   'Getting There',
                   'Rollerball',
                   'Where the Heart Is')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('Datasat',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'SDDS')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Austria',
                    'Belgium',
                    'Denmark',
                    'Ireland',
                    'Italy',
                    'Poland',
                    'Portugal',
                    'Soviet Union',
                    'Spain',
                    'Switzerland',
                    'West Germany')
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
                   'cinematographer',
                   'guest',
                   'producer',
                   'production designer'));