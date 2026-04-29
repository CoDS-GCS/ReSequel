WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year > 1925
     AND kt.kind IN ('tv series',
                  'video game'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adventure',
                   'Crime',
                   'Drama',
                   'Family',
                   'Thriller',
                   'Western')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:Atp',
                   'Finland:K-12',
                   'Finland:K-16',
                   'Norway:16',
                   'Sweden:15',
                   'UK:A',
                   'USA:Approved',
                   'West Germany:16',
                   'West Germany:18')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IN ('m');