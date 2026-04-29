
SELECT COUNT(*)
FROM
  (SELECT t.id
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
     AND t.kind_id = kt.id
     AND ci.person_id = n.id
     AND ci.role_id = rt.id
     AND it1.id IN ('4')
     AND it2.id IN ('17')
     AND mi1.info IN ('Arabic',
                    'English',
                    'French',
                    'German',
                    'Hindi',
                    'Japanese',
                    'Swedish')
     AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
     AND kt.kind IN ('movie',
                   'tv series')
     AND rt.role IN ('costume designer',
                   'guest',
                   'miscellaneous crew')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1875 AND 1975) AS subquery;