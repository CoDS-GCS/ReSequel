WITH movie_ids AS (
                     (SELECT movie_id
                      FROM movie_info
                      WHERE info_type_id IN ('8')
                        AND info IN ('Australia',
                    'Canada',
                    'Germany',
                    'Italy',
                    'Japan',
                    'Philippines',
                    'Soviet Union',
                    'Spain',
                    'UK',
                    'USA',
                    'West Germany')) INTERSECT
                     (SELECT movie_id
                      FROM movie_info
                      WHERE info_type_id IN ('17')
                        AND info IN ('One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')))
SELECT COUNT(*)
FROM title AS t
JOIN movie_ids mi ON t.id = mi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.116)',
                   '(#1.6)',
                   '(#3.32)',
                   '(#5.13)',
                   '(#5.27)',
                   '(#8.13)',
                   'A Cry for Help',
                   'A Friend in Need',
                   'A Shot in the Dark',
                   'Amok',
                   'Antony and Cleopatra',
                   'Boomerang',
                   'Broadway Bill',
                   'Crossfire',
                   'Dritter Teil',
                   'Du Barry Was a Lady',
                   'Ill Tell the World',
                   'It Happened One Night',
                   'Jailhouse Rock',
                   'Kitty Foyle',
                   'Mutiny',
                   'Night Club',
                   'Of Human Bondage',
                   'Only Yesterday',
                   'Rhubarb',
                   'The Executioner',
                   'The Haunted House',
                   'The Kid from Brooklyn',
                   'The Kill',
                   'The Red Shoes',
                   'The Storm',
                   'The Tunnel',
                   'The Widow',
                   'Till We Meet Again',
                   'Till the Clouds Roll By',
                   'Ultimatum',
                   'Unter Ausschluß der Öffentlichkeit',
                   'You Came Along')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'costume designer',
                   'producer',
                   'production designer',
                   'writer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);