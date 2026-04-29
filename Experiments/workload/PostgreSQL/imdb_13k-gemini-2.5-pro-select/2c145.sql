WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1875
     AND t.title IN ('(#1.91)',
                   '(#2.37)',
                   'As Pupilas do Senhor Reitor',
                   'Countdown',
                   'Erster Teil',
                   'Nora',
                   'Ordeal',
                   'Riffraff',
                   'Side Street',
                   'The Last Man',
                   'The Rivals',
                   'Too Many Cooks',
                   'Up the River',
                   'Vierter Teil')
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f',
                    'm')
     AND rt.role IN ('director',
                   'editor',
                   'producer',
                   'production designer')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('7')
     AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe',
                    'MET:',
                    'MET:15.2 m',
                    'MET:1500 m',
                    'MET:1800 m',
                    'OFM:35 mm',
                    'PCS:(anamorphic)',
                    'PCS:Shawscope',
                    'PCS:Techniscope',
                    'RAT:1.36 : 1'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');