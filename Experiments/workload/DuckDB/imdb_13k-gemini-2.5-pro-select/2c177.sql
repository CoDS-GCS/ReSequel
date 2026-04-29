WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 2015
     AND t.production_year >= 1990
     AND t.title IN ('(1997-12-17)',
                   '(1999-02-19)',
                   '(2000-03-21)',
                   'Anna and the King',
                   'Birth of a Salesman',
                   'Engraçadinha... Seus Amores e Seus Pecados',
                   'FC Venus',
                   'Judas Priest',
                   'Let No Man Put Asunder',
                   'Safari',
                   'The Bench',
                   'The Guardian',
                   'Truth or Dare',
                   'Unad Will Be Asked If He Wants to Force Evict One of His Housemates',
                   'What If...')
     AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f',
                    'm')
     AND rt.role IN ('actor',
                   'editor',
                   'guest')),
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
WHERE mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'Brazil',
                    'Chile',
                    'Israel',
                    'Nigeria',
                    'Thailand',
                    'Turkey',
                    'USA',
                    'Ukraine');