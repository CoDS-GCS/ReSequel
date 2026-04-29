
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   JOIN keyword AS k ON mk.keyword_id = k.id
   JOIN movie_companies AS mc ON t.id = mc.movie_id
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND k.keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'based-on-play',
                     'dancing',
                     'kidnapping',
                     'male-frontal-nudity',
                     'murder',
                     'new-york-city',
                     'nudity',
                     'number-in-title',
                     'oral-sex',
                     'revenge',
                     'song')
     AND cn.country_code IN ('[ar]',
                           '[ie]',
                           '[ng]')
     AND ct.kind IN ('production companies')
     AND n.gender IN ('f')
     AND rt.role IN ('composer',
                   'costume designer')
   GROUP BY t.id) AS sub;