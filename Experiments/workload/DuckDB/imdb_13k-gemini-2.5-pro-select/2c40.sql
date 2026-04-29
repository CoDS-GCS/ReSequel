WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1925
     AND t.title IN ('(#1.108)',
                   '(#1.36)',
                   '(#3.43)',
                   '(#3.52)',
                   '(#5.2)',
                   '(#6.10)',
                   '(#6.9)',
                   'Big City',
                   'Crime Wave',
                   'Holnap lesz fácán',
                   'Jesse James',
                   'Kid Galahad',
                   'Out of the Blue',
                   'Ruggles of Red Gap',
                   'The Accident',
                   'The Adventures of Huckleberry Finn',
                   'The Arrangement',
                   'The Birthday',
                   'The Bribe',
                   'The Gold Rush',
                   'The Last Man',
                   'The Masked Marvel',
                   'The Outcast',
                   'The Outsider',
                   'Welcome Stranger',
                   'Who Done It?')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND rt.role IN ('costume designer')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Technicolor, USA',
                    'PCS:CinemaScope',
                    'PCS:Spherical',
                    'RAT:1.66 : 1');