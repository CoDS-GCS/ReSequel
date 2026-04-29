
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
  AND it1.id IN ('105')
  AND it2.id IN ('3')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('$1,000',
                    '$1,500,000',
                    '$10,000,000',
                    '$18,000',
                    '$25,000,000',
                    '$3,000',
                    '$300,000',
                    'CAD 2,000',
                    '£100,000',
                    '€ 10,000',
                    '€ 40,000',
                    '€ 5,000')
  AND mi2.info IN ('Drama',
                    'Horror',
                    'Music',
                    'Mystery',
                    'Short',
                    'Thriller',
                    'War')
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video movie')
  AND rt.role IN ('costume designer',
                   'guest')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1990 AND 2015;