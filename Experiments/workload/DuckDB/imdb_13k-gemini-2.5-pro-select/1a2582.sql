
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
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
  AND it1.id IN ('5')
  AND it2.id IN ('3')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Argentina:Atp',
                    'Canada:PG',
                    'Germany:16',
                    'Germany:6',
                    'UK:A')
  AND mi2.info IN ('Adult',
                    'Adventure',
                    'Animation',
                    'Biography',
                    'Crime',
                    'Drama',
                    'Family',
                    'Film-Noir',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Short',
                    'Thriller',
                    'War',
                    'Western')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'composer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1925 AND 1975;