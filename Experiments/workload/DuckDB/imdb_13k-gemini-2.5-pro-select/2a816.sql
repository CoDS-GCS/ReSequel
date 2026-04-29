WITH t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('105')
   AND mi1.info IN ('$12,000',
                    '$2,000,000',
                    '$2,500',
                    '$200',
                    '$300',
                    '$35,000',
                    '$40,000',
                    '$5,000,000',
                    '$6,000',
                    '$8,000',
                    '£1,000',
                    '£10,000',
                    '€ 1,000',
                    '€ 10,000',
                    '€ 5,000')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('2')
   AND mi2.info IN ('Color')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('episode',
                   'video movie')
   WHERE t.production_year BETWEEN 1990 AND 2015)
SELECT COUNT(*)
FROM t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor')
JOIN movie_keyword AS mk ON t_mi.id = mk.movie_id;