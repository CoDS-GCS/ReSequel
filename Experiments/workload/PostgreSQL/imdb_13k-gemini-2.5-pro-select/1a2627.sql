 
 
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
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('France',
                    'Hawaii, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Las Vegas, Nevada, USA',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Spain',
                    'Vasquez Rocks Natural Area Park - 10700 W. Escondido Canyon Rd., Agua Dulce, California, USA',
                    'Washington, District of Columbia, USA')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:16',
                    'Argentina:Atp',
                    'Australia:PG',
                    'Canada:A',
                    'France:-12',
                    'France:-16',
                    'Iceland:16',
                    'Netherlands:18',
                    'Portugal:M/12',
                    'Portugal:M/6',
                    'Spain:T',
                    'Sweden:11',
                    'USA:TV-14',
                    'USA:TV-G')
  AND n.gender IS NULL
  AND rt.role IN ('director');