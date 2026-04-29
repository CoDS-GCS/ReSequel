WITH filtered_movie_companies AS
  (SELECT mc.movie_id
   FROM company_name AS cn
   JOIN movie_companies AS mc ON cn.id = mc.company_id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('American Broadcasting Company (ABC)',
                   'National Broadcasting Company (NBC)',
                   'Universal Film Manufacturing Company')
     AND ct.kind IN ('distributors'))
SELECT COUNT(*)
FROM filtered_movie_companies AS fmc
JOIN title AS t ON fmc.movie_id = t.id
AND t.production_year BETWEEN 1875 AND 1975
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
AND n.name_pcode_nf IN ('E4213',
                           'K6235')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Comedy',
                    'Western')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('3')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;