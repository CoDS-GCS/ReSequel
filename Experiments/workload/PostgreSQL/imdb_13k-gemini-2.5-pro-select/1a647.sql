 
 
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     movie_info AS mi1,
     info_type AS it1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND it1.id = '3'
  AND it2.id = '5'
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Drama',
                   'Horror',
                   'Romance',
                   'Thriller')
  AND mi2.info IN ('Australia:G',
                   'Belgium:KT',
                   'Iceland:16',
                   'Norway:16',
                   'Sweden:15',
                   'USA:Not Rated',
                   'West Germany:12')
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND rt.role IN ('director')
  AND n.gender IN ('m')
  AND t.production_year <= 1990
  AND t.production_year > 1950;