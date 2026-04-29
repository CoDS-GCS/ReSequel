 
 
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
     AND it2.id IN ('5')
     AND mi1.info IN ('107',
                    '24',
                    '50',
                    '81',
                    'Argentina:60',
                    'Germany:91',
                    'USA:100',
                    'USA:109',
                    'USA:112',
                    'USA:118',
                    'USA:91',
                    'USA:95')
     AND mi2.info IN ('Iceland:16',
                    'Ireland:PG',
                    'Mexico:B',
                    'Netherlands:AL',
                    'Portugal:M/12',
                    'Portugal:M/16',
                    'South Korea:15',
                    'South Korea:All',
                    'Switzerland:16')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
     AND rt.role IN ('actress',
                   'composer',
                   'director',
                   'guest',
                   'writer')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1990 AND 2015) AS subquery;