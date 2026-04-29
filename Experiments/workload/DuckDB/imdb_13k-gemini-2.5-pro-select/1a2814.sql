
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
  AND it1.id IN ('3')
  AND it2.id IN ('6')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Adult',
                    'Comedy',
                    'Crime',
                    'Family',
                    'Film-Noir',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Sport',
                    'Western')
  AND mi2.info IN ('70 mm 6-Track',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('composer',
                   'director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1925 AND 1975;