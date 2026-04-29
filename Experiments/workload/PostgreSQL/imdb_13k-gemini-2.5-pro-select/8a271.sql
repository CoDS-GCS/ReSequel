WITH filtered_movie_companies AS
  (SELECT mc.movie_id
   FROM company_name AS cn
   JOIN movie_companies AS mc ON cn.id = mc.company_id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video')
     AND ct.kind IN ('distributors',
                   'production companies'))
SELECT COUNT(*)
FROM filtered_movie_companies AS fmc
JOIN title AS t ON fmc.movie_id = t.id
AND t.production_year BETWEEN 1975 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'producer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                    'm')
AND n.name_pcode_nf IN ('A4252',
                           'B1626',
                           'C6421',
                           'F6525',
                           'J52',
                           'M2425',
                           'P3625',
                           'R1631',
                           'R1635',
                           'R1636')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Drama',
                    'Family',
                    'Fantasy',
                    'Horror',
                    'Music',
                    'Sci-Fi',
                    'Short')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('3')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;