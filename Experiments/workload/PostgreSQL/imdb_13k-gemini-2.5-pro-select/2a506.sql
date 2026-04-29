
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('producer')
  AND n.gender IN ('m')
  AND it1.id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Crime',
                    'Drama',
                    'Romance',
                    'Short')
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Finland:K-16',
                    'Sweden:15',
                    'UK:U',
                    'USA:Approved');