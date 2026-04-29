
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info AS mi2 ON t.id = mi2.movie_id
INNER JOIN info_type AS it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.126)',
                   '(#2.27)',
                   '(#3.38)',
                   '(#5.18)',
                   'Blind Mans Bluff',
                   'Brief Encounter',
                   'By the Book',
                   'Cover Girl',
                   'Dead Ringer',
                   'Dillinger',
                   'For Better, for Worse',
                   'Framed',
                   'Land of Liberty',
                   'Love Thy Neighbour',
                   'Man of a Thousand Faces',
                   'Number 96',
                   'Othello',
                   'The Cats-Paw',
                   'The Duel',
                   'The Inside Man',
                   'The Little Minister',
                   'The Swinger',
                   'The Terror',
                   'The Victim',
                   'The Walls of Jericho',
                   'Violence')
  AND kt.kind IN ('movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('107',
                    '111',
                    '118',
                    '25',
                    '57',
                    '61',
                    '64',
                    '69',
                    '78',
                    '88',
                    '94',
                    'USA:7',
                    'USA:85')
  AND it2.id IN ('5')
  AND mi2.info IN ('Belgium:KT',
                    'Canada:G',
                    'Finland:(Banned)',
                    'Finland:S',
                    'UK:15')
  AND rt.role IN ('actress',
                   'director',
                   'guest',
                   'production designer',
                   'writer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);