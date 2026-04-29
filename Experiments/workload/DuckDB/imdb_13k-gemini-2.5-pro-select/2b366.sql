
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie') INTERSECT SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bloody-sofa',
                     'chisel',
                     'kigali-rwanda',
                     'lights-in-the-sky',
                     'overtime',
                     'reference-to-brian-williams',
                     'selling-shrimp',
                     'tarascosaur') INTERSECT SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('editor') INTERSECT SELECT mi.movie_id
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('3')
     AND mi.info IN ('Comedy',
                    'Documentary',
                    'Horror',
                    'Reality-TV',
                    'Short') INTERSECT SELECT mi.movie_id
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('Dutch',
                    'English',
                    'Italian')) AS RESULT;