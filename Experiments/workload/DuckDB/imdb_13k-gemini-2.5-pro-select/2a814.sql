
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
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND it1.id IN ('4')
  AND mi1.info IN ('Bengali',
                    'Cantonese',
                    'Czech',
                    'Icelandic',
                    'Indonesian',
                    'Mandarin',
                    'Persian',
                    'Russian',
                    'Slovak',
                    'Swiss German')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');