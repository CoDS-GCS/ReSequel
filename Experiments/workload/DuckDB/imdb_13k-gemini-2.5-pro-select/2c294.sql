WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1875
     AND t.title IN ('(#1.108)',
                   '(#2.21)',
                   '(#3.32)',
                   'Blue Skies',
                   'Honeymoon',
                   'Joan of Arc',
                   'My Favorite Spy',
                   'Never Say Die',
                   'Night and Day',
                   'Perfect Strangers',
                   'Reign of Terror',
                   'Resurrection',
                   'San Francisco',
                   'Stella',
                   'The Clock',
                   'The Engagement',
                   'The Fall Guy',
                   'The Hound of the Baskervilles',
                   'The Journey',
                   'The Kid',
                   'Welcome Stranger',
                   'Yôsei Gorasu')
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
   WHERE n.gender IN ('m')
     AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew')),
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
                    'LAB:DeLuxe',
                    'LAB:Technicolor',
                    'MET:100 m',
                    'MET:15.2 m',
                    'MET:150 m',
                    'MET:900 m',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:68 mm',
                    'RAT:1.37 : 1');