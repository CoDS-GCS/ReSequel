WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.107)',
                   '(#2.13)',
                   '(#4.15)',
                   '(#4.6)',
                   '(#4.9)',
                   '(#6.21)',
                   'Aoi sanmyaku',
                   'Crime et châtiment',
                   'Dick Tracy',
                   'Die Fledermaus',
                   'Dirty Harry',
                   'Double Exposure',
                   'Easy Come, Easy Go',
                   'End of the Road',
                   'Finders Keepers',
                   'Gabriela',
                   'Gilda',
                   'König Drosselbart',
                   'Letter of the Law',
                   'Mardi Gras',
                   'Quarantine',
                   'Reap the Wild Wind',
                   'Riffraff',
                   'She Gets Her Man',
                   'Start Cheering',
                   'The Bargain Hunt',
                   'The Box',
                   'The Debt',
                   'The Fighting Devil Dogs',
                   'The Fugitives',
                   'The Importance of Being Earnest',
                   'The Iron Major',
                   'The Kid',
                   'The Kidnapping',
                   'The Life of the Party',
                   'The Paleface',
                   'The Perils of Pauline',
                   'The Phantom Rider',
                   'The Professionals',
                   'The Reckoning',
                   'The Texas Rangers',
                   'The Toast of New York',
                   'The Verdict',
                   'The Visitor',
                   'The Women',
                   'Waterloo',
                   'Wing and a Prayer')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
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
WHERE n.gender IN ('m')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'editor',
                   'writer')
  AND it1.id IN ('8')
  AND mi1.info IN ('Austria',
                    'Canada',
                    'Czechoslovakia',
                    'Finland',
                    'France',
                    'Germany',
                    'Greece',
                    'Hungary',
                    'Japan',
                    'Netherlands',
                    'Portugal',
                    'Sweden')
  AND it2.id IN ('1')
  AND mi2.info IN ('10',
                    '30',
                    '7',
                    '8',
                    '86',
                    '89',
                    '9',
                    '90',
                    '95',
                    '96');