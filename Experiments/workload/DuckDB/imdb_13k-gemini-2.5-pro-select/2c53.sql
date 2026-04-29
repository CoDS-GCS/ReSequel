WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.27)',
                   '(#1.94)',
                   '(#2.15)',
                   '(#2.25)',
                   '(#6.12)',
                   '(#7.9)',
                   'Act of Violence',
                   'Charleys Tante',
                   'Contraband',
                   'Dakota',
                   'Dick Tracys G-Men',
                   'Divide and Conquer',
                   'Fiesta',
                   'Force of Evil',
                   'Hello, Dolly!',
                   'Knute Rockne All American',
                   'Los miserables',
                   'Paid in Full',
                   'Ransom',
                   'Running Wild',
                   'Sarajevski atentat',
                   'Swing Fever',
                   'The Big Shot',
                   'The Execution',
                   'The Exile',
                   'The Fugitives',
                   'The Raven',
                   'The Star Maker',
                   'The Survivor')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv series'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer',
                   'director',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('Arabic',
                    'Dutch',
                    'English',
                    'French',
                    'German',
                    'Hindi',
                    'Japanese',
                    'Latin',
                    'Mandarin',
                    'Portuguese',
                    'Russian',
                    'Spanish',
                    'Swedish',
                    'Telugu')
  AND mi2.info IN ('Australia:G',
                    'Belgium:KT',
                    'Finland:(Banned)',
                    'Finland:K-8',
                    'Germany:16',
                    'Netherlands:18',
                    'Norway:16',
                    'Sweden:15',
                    'UK:15',
                    'USA:G',
                    'USA:Passed',
                    'USA:R',
                    'USA:TV-G',
                    'West Germany:18');