
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adult',
                   'Animation',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Horror',
                   'Mystery',
                   'Romance')
  AND t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('video movie')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:G',
                   'Australia:M',
                   'Australia:MA',
                   'Australia:PG',
                   'Canada:PG',
                   'Germany:12',
                   'Hong Kong:IIB',
                   'South Korea:18',
                   'UK:12',
                   'UK:15',
                   'USA:Unrated')
  AND rt.role IN ('producer',
                  'writer')
  AND n.gender IN ('f',
                   'm');