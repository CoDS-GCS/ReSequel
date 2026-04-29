
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1925
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Musical',
                   'Short',
                   'Thriller')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:G',
                   'Australia:PG',
                   'Australia:R',
                   'Brazil:Livre',
                   'Germany:12',
                   'Italy:VM14',
                   'Netherlands:16',
                   'Norway:16',
                   'Singapore:M18',
                   'Singapore:R21',
                   'UK:12A',
                   'USA:Unrated',
                   'West Germany:16',
                   'West Germany:6')
  AND rt.role IN ('editor')
  AND n.gender IN ('f');