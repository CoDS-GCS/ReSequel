WITH filtered_movie_companies AS
  (SELECT mc.movie_id
   FROM company_name AS cn
   JOIN movie_companies AS mc ON cn.id = mc.company_id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video')
     AND ct.kind IN ('distributors',
                   'production companies'))
SELECT COUNT(*)
FROM filtered_movie_companies AS fmc
JOIN title AS t ON fmc.movie_id = t.id
AND t.production_year BETWEEN 1950 AND 1990
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
AND n.name_pcode_nf IN ('B6161',
                           'C6235',
                           'K3451',
                           'M6263')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Dolby Digital',
                    'Mono',
                    'SDDS',
                    'Stereo')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('6')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;