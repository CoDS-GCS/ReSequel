WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1875
     AND t.title IN ('(#1.57)',
                   'A Shot in the Dark',
                   'Daddy Long Legs',
                   'Double Indemnity',
                   'Forbidden',
                   'Im weißen Rößl',
                   'Lover Come Back',
                   'Protest',
                   'Sweethearts',
                   'The Helen Morgan Story',
                   'The Ordeal',
                   'The Ugly Duckling',
                   'Yellow Jack')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('composer',
                   'costume designer')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('4')
     AND mi1.info IN ('French',
                    'Georgian',
                    'German',
                    'Hindi',
                    'Hungarian',
                    'Norwegian',
                    'Romanian',
                    'Urdu'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');