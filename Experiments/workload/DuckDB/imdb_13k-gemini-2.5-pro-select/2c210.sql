
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1990
  AND t.production_year >= 1950
  AND t.title IN ('(#1.10)',
                   '(#1.230)',
                   '(#1.275)',
                   '(#1.320)',
                   '(#1.344)',
                   '(#1.414)',
                   '(#1.541)',
                   '(#1.563)',
                   '(#1.6)',
                   '(#1.642)',
                   '(#2.76)',
                   '(#4.41)',
                   '(#4.5)',
                   'A Night of Comic Relief 2',
                   'A Piece of the Action',
                   'Above the Law',
                   'Adventures in Babysitting',
                   'Another Country',
                   'Asa Branca - Um Sonho Brasileiro',
                   'Battle of the Bulge',
                   'Cannonball Run II',
                   'Come Out Fighting',
                   'Competition',
                   'Deja Vu',
                   'Flash Point',
                   'Hearts and Flowers',
                   'Hidden Agenda',
                   'Its Magic',
                   'Koncert',
                   'Love Me or Leave Me',
                   'Nothing But the Truth',
                   'Pension Schöller',
                   'The Cotton Club',
                   'The Engagement',
                   'Whats Up, Doc?',
                   'White Palace')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Belgium:KT',
                    'Finland:K-18',
                    'Portugal:M/16',
                    'Portugal:M/18',
                    'USA:TV-G',
                    'West Germany:12',
                    'West Germany:16')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer'));