
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('8')
AND mi1.info IN ('Australia',
                    'Canada',
                    'France',
                    'Philippines',
                    'Spain',
                    'USA',
                    'West Germany')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('17')
AND mi2.info IN ('One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'costume designer',
                   'editor')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('m')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.110)',
                   '(#1.25)',
                   '(#1.29)',
                   '(#1.30)',
                   '(#1.38)',
                   '(#1.41)',
                   '(#1.65)',
                   '(#3.28)',
                   '(#3.37)',
                   '(#6.8)',
                   '(#7.1)',
                   'Above Suspicion',
                   'Beatrice Cenci',
                   'Countdown',
                   'Crossfire',
                   'Folies Bergère de Paris',
                   'Forbidden',
                   'Game 1',
                   'Here Comes the Groom',
                   'Jeanne Eagels',
                   'Johnny Belinda',
                   'Jugovizija',
                   'Kiss Me Kate',
                   'La porteuse de pain',
                   'Lenny',
                   'Million Dollar Baby',
                   'Mr. Skeffington',
                   'Murder by Proxy',
                   'Pacific Blackout',
                   'Playmates',
                   'Pressure Point',
                   'Richard III',
                   'Scrooge',
                   'Start Cheering',
                   'Tango',
                   'The Alamo',
                   'The Caddy',
                   'The City',
                   'The Executioner',
                   'The Silent Witness',
                   'The Verdict',
                   'Togetherness',
                   'Troubled Waters');