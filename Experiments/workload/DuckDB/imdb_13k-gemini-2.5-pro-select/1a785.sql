
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Comedy',
                   'Crime',
                   'Drama',
                   'Horror',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Argentina:Atp',
                   'Australia:MA',
                   'Hong Kong:IIB',
                   'Netherlands:16',
                   'Portugal:M/12',
                   'Singapore:PG',
                   'Switzerland:12',
                   'Switzerland:14',
                   'Switzerland:7',
                   'UK:15',
                   'USA:Not Rated')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
WHERE t.production_year <= 2015
  AND t.production_year > 1990;