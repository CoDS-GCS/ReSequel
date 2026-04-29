
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('episode',
                   'video movie') INTERSECT SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'cigarette-smoking',
                     'dancing',
                     'dog',
                     'female-nudity',
                     'nudity') INTERSECT SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('writer') INTERSECT SELECT mi.movie_id
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English') INTERSECT SELECT mi.movie_id
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('105')
     AND mi.info IN ('$1,000,000',
                    '$100',
                    '$150,000',
                    '$2,000,000',
                    '$200',
                    '$200,000',
                    '$500,000')) AS RESULT;