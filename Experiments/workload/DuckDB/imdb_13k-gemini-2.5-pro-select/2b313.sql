WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('amateur-film-festival',
                     'boastful',
                     'book-on-top-of-head',
                     'church-bells',
                     'conflicting-directions',
                     'dreadnought',
                     'drug-courier',
                     'facial-reconstruction',
                     'hatred-against-mother',
                     'latter-day-saints',
                     'math-exam',
                     'ogre',
                     'parental-protection',
                     'pieter-bruegel',
                     'real-life-incident',
                     'research-funding',
                     'sex-with-butler',
                     'shaved-chest',
                     'slack-key-guitar',
                     'subway',
                     'tied-spread-eagle-face-down',
                     'woman-stabbed'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('8')
  AND mi1.info IN ('Albania',
                    'Austria',
                    'Brazil',
                    'Denmark',
                    'France',
                    'Ireland',
                    'Israel',
                    'Italy',
                    'Japan',
                    'Mexico',
                    'South Korea',
                    'Sweden',
                    'Taiwan')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Family',
                    'History',
                    'Music',
                    'Mystery',
                    'Romance')
  AND rt.role IN ('actress',
                   'director')
  AND n.gender IN ('f',
                    'm');