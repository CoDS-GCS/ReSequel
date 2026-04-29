WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.17)',
                   '(#1.89)',
                   '(#1.94)',
                   '(#5.26)',
                   'A Midsummer Nights Dream',
                   'Aida',
                   'Aint Misbehavin',
                   'Anniversary',
                   'Aoi sanmyaku',
                   'Carnival',
                   'Der Meineidbauer',
                   'Follow the Boys',
                   'Ghost Catchers',
                   'Impact',
                   'Law and Order',
                   'Neighbors',
                   'No Escape',
                   'Partners',
                   'Possessed',
                   'The City',
                   'The Girl of the Golden West',
                   'The Green Hornet',
                   'The Gun Runners',
                   'The Helen Morgan Story',
                   'The Human Jungle',
                   'The Hunchback of Notre Dame',
                   'The Informer',
                   'The Kid from Texas',
                   'The Man Who Broke the Bank at Monte Carlo',
                   'The Merchant of Venice',
                   'The Phantom Rider',
                   'The Prowler',
                   'The Test',
                   'The Walls of Jericho',
                   'The Woman in White',
                   'Ultimatum',
                   'Union Pacific',
                   'Unter Ausschluß der Öffentlichkeit')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('composer',
                   'guest',
                   'production designer')
  AND it1.id IN ('1')
  AND mi1.info IN ('13',
                    '25',
                    '35',
                    '80',
                    '82',
                    '89',
                    '9',
                    '94',
                    'USA:20')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adult',
                    'Documentary',
                    'Drama',
                    'Musical',
                    'War',
                    'Western');