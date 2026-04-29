
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
  AND t.title IN ('(#1.274)',
                   '(#1.326)',
                   '(#1.364)',
                   '(#1.80)',
                   '(#1.970)',
                   '(#10.7)',
                   '(#4.18)',
                   '(#6.2)',
                   'A Change of Heart',
                   'All of Me',
                   'Amanece, que no es poco',
                   'Babe',
                   'Billy the Kid',
                   'Childhoods End',
                   'Code of Silence',
                   'Daddy Dearest',
                   'Downtown',
                   'Dyesebel',
                   'Friends and Enemies',
                   'Full Circle',
                   'Game 4',
                   'Iris',
                   'Kabale und Liebe',
                   'Noblesse Oblige',
                   'Palace',
                   'Pepe',
                   'Say Yes',
                   'Solar Crisis',
                   'Some Like It Hot',
                   'Strangers in Paradise',
                   'The Border',
                   'The Champ',
                   'The Garden',
                   'The Loser',
                   'The Phoenix',
                   'The Skin Game',
                   'To Tell the Truth',
                   'Twilight Zone: The Movie',
                   'Vodkaa, komisario Palmu',
                   'Zatôichi')
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Czech',
                    'Danish',
                    'Estonian',
                    'Finnish',
                    'Greek',
                    'Hebrew',
                    'Polish',
                    'Tamil')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Crime',
                    'Documentary',
                    'Fantasy',
                    'History',
                    'Music',
                    'Sci-Fi')
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
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'costume designer',
                   'miscellaneous crew',
                   'producer',
                   'production designer'));