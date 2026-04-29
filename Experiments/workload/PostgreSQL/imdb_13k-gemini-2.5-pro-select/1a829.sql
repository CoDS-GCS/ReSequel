 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Adventure',
                   'Animation',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Musical',
                   'Romance',
                   'Western')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Argentina:Atp',
                   'Australia:G',
                   'Finland:S',
                   'Sweden:15',
                   'USA:Approved',
                   'USA:Not Rated',
                   'USA:Passed',
                   'USA:TV-G',
                   'West Germany:12')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('editor',
                  'writer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                   'm')
WHERE t.production_year <= 1975
  AND t.production_year > 1875;