WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('movie')),
     matching_persons AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND n.name_pcode_nf IN ('M6263')
     AND rt.role IN ('actress')),
     matching_companies AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('Metro-Goldwyn-Mayer (MGM)',
                   'Warner Home Video')
     AND ct.kind IN ('distributors')),
     matching_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE mi1.info IN ('Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA')
     AND it1.id IN ('18'))
SELECT COUNT(*)
FROM matching_persons AS p
JOIN filtered_titles AS t ON t.id = p.movie_id
JOIN matching_companies AS c ON t.id = c.movie_id
JOIN matching_info AS i ON t.id = i.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;