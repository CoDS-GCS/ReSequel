
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
  AND t.title IN ('(#1.109)',
                   '(#1.88)',
                   '(#2.1)',
                   '(#3.12)',
                   '(#4.18)',
                   '(#6.7)',
                   '(#7.20)',
                   'Conspiracy of Silence',
                   'Dead of Night',
                   'Der Rosenkavalier',
                   'Die Brücke',
                   'Dinner at Eight',
                   'Drums of Fu Manchu',
                   'El amor tiene cara de mujer',
                   'Interlude',
                   'Justice',
                   'Meet Danny Wilson',
                   'New Musical Express Poll Winners Concert',
                   'Once in a Lifetime',
                   'Pacific Blackout',
                   'Saturdays Hero',
                   'Si Paris nous était conté',
                   'St. Louis Blues',
                   'Stage Fright',
                   'Stakeout',
                   'The Accident',
                   'The Adventures of Huckleberry Finn',
                   'The Godfather',
                   'The Name of the Game',
                   'The Professional',
                   'The Reward',
                   'The Specialists',
                   'The Story of Will Rogers',
                   'Treasure Island',
                   'Two of a Kind',
                   'Voyna i mir',
                   'Who Was That Lady?')
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Mexico',
                    'Pakistan',
                    'Poland',
                    'South Korea',
                    'Soviet Union',
                    'Switzerland')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
     WHERE ROLE IN ('actress'));