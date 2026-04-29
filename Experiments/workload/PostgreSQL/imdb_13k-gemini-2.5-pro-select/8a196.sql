WITH matching_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('movie',
                   'video movie')),
     matching_mi AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('4')
     AND mi1.info IN ('English',
                    'Spanish')),
     matching_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actress')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('M6263')
          OR n.name_pcode_nf IS NULL)),
     matching_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE cn.name IN ('Metro-Goldwyn-Mayer (MGM)',
                   'Paramount Pictures',
                   'Pathé Frères',
                   'Universal Pictures',
                   'Warner Home Video')
     AND ct.kind IN ('distributors',
                   'production companies'))
SELECT COUNT(*)
FROM matching_titles AS t
JOIN matching_mi AS mi ON t.id = mi.movie_id
JOIN matching_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN matching_mc AS mc ON t.id = mc.movie_id;