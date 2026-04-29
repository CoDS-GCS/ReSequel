
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
     AND it1.id IN ('1')
     AND it2.id IN ('4')
     AND mi1.info IN ('72',
                    '78',
                    '94',
                    'Argentina:30',
                    'USA:120')
     AND mi2.info IN ('Bulgarian',
                    'German',
                    'Greek',
                    'Italian',
                    'None',
                    'Swedish',
                    'Turkish')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game')
     AND rt.role IN ('writer')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1950 AND 1990) AS subquery;