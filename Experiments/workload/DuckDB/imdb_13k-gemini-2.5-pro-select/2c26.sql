WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.104)',
                   '(#1.53)',
                   '(#1.83)',
                   '(#1.97)',
                   '(#2.29)',
                   '(#4.27)',
                   '(#6.10)',
                   '(#7.4)',
                   'All the Kings Men',
                   'By the Book',
                   'Cyrano de Bergerac',
                   'Der Hauptmann von Köpenick',
                   'Exposed',
                   'Janie',
                   'La porteuse de pain',
                   'Like Father, Like Son',
                   'Miyamoto Musashi',
                   'Once in a Lifetime',
                   'Reunion in France',
                   'Rich Man, Poor Man',
                   'Target',
                   'The Beginning or the End',
                   'The Daring Young Man',
                   'The Locket',
                   'The Plainsman',
                   'The Shadow',
                   'The Silent Witness',
                   'The Spoilers',
                   'The Web',
                   'Time to Kill',
                   'Who Done It?',
                   'Your Witness')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f')
  AND rt.role IN ('actress')
  AND it1.id IN ('4')
  AND mi1.info IN ('Bulgarian',
                    'Dutch',
                    'Filipino',
                    'German',
                    'Hungarian',
                    'Mandarin',
                    'Polish',
                    'Swedish')
  AND it2.id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo');