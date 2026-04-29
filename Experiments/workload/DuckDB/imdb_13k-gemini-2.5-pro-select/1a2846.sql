
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
  AND it1.id IN ('1')
  AND it2.id IN ('4')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('13',
                    '28',
                    '30',
                    '5',
                    '58',
                    '59',
                    '69',
                    '86',
                    '95',
                    'Argentina:30',
                    'USA:15',
                    'USA:20',
                    'USA:7')
  AND mi2.info IN ('Czech',
                    'Dutch',
                    'English',
                    'Finnish',
                    'French',
                    'German',
                    'Greek',
                    'Hindi',
                    'Mandarin',
                    'Polish',
                    'Portuguese',
                    'Russian',
                    'Spanish',
                    'Turkish')
  AND kt.kind IN ('episode',
                   'tv series',
                   'video movie')
  AND rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'miscellaneous crew',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1875 AND 1975;