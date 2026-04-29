
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('f',
                   'm')
  AND rt.role IN ('actress',
                  'cinematographer')
  AND t.production_year <= 1975
  AND t.production_year > 1875
  AND kt.kind IN ('tv series')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adult',
                   'Adventure',
                   'Animation',
                   'Documentary',
                   'Drama',
                   'Musical',
                   'Romance',
                   'Thriller',
                   'War',
                   'Western')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:Atp',
                   'Australia:G',
                   'Finland:K-16',
                   'Finland:S',
                   'Sweden:15',
                   'UK:U',
                   'USA:Approved',
                   'USA:TV-G',
                   'USA:X');