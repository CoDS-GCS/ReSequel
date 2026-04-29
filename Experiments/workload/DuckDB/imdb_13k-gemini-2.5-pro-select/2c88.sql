WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.123)',
                   '(#1.24)',
                   '(#1.46)',
                   '(#1.56)',
                   '(#1.70)',
                   '(#2.17)',
                   '(#3.22)',
                   '(#8.5)',
                   'Austerlitz',
                   'Behind the Mask',
                   'Body and Soul',
                   'Brotherly Love',
                   'Caesars Wife',
                   'Der Rosenkavalier',
                   'Der Unfall',
                   'False Witness',
                   'Ghost Catchers',
                   'Golden Boy',
                   'Jailhouse Rock',
                   'Jeanne Eagels',
                   'Knock on Any Door',
                   'Marriage',
                   'Night of Terror',
                   'Ricochet',
                   'Roman Holiday',
                   'Skin Game',
                   'Strange Cargo',
                   'Stranger in Town',
                   'TV-Avisen',
                   'The Auction',
                   'The Band Wagon',
                   'The Front Page',
                   'The Gangs All Here',
                   'The Great Gatsby',
                   'The Great Impersonation',
                   'The Hard Way',
                   'The Hitler Gang',
                   'The Honeymoon',
                   'The Invaders',
                   'The Pride of the Yankees',
                   'The Reward',
                   'The Story of Will Rogers',
                   'They Were Expendable',
                   'Thérèse Raquin',
                   'Untamed',
                   'Unusual Occupations',
                   'War Games')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('5')
  AND mi2.info_type_id IN ('4')
  AND mi1.info IN ('Argentina:18',
                    'Canada:PG',
                    'India:U',
                    'Italy:VM18',
                    'Sweden:15',
                    'USA:TV-G')
  AND mi2.info IN ('Dutch',
                    'English',
                    'Finnish',
                    'French',
                    'Hindi',
                    'Italian',
                    'Latin',
                    'Russian',
                    'Swedish');