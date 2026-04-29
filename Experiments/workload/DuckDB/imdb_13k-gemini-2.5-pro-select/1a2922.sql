
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
  AND it1.id IN ('8')
  AND it2.id IN ('16')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Latvia',
                    'Pakistan',
                    'Poland',
                    'Romania',
                    'Singapore')
  AND mi2.info IN ('Nigeria:2006',
                    'Nigeria:2007',
                    'USA:1993',
                    'USA:1996',
                    'USA:1999')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'video game')
  AND rt.role IN ('composer',
                   'costume designer',
                   'producer',
                   'production designer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1975 AND 2015;