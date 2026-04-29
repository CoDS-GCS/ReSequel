 
 WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'video movie')),
     mi1_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('8')
     AND mi1.info IN ('China',
                    'Colombia',
                    'Croatia',
                    'Estonia',
                    'Iran',
                    'Peru',
                    'Poland',
                    'Serbia',
                    'Slovakia',
                    'South Africa',
                    'Thailand',
                    'UK')),
     mi2_filtered AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('2')
     AND mi2.info IN ('Black and White',
                    'Color')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE (n.gender IN ('m')
          OR n.gender IS NULL)
     AND rt.role IN ('miscellaneous crew'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN keyword k ON mk.keyword_id = k.id;