WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 2015
     AND t.production_year >= 1925
     AND t.title IN ('(#1.11635)',
                   '(#1.4795)',
                   '(#1.536)',
                   '(#1.651)',
                   '(#4.198)',
                   '(#6.181)',
                   '(2000-02-27)',
                   '(2002-09-25)',
                   '(2004-02-23)',
                   '(2011-03-28)',
                   '(2012-12-16)',
                   'Black Noise',
                   'Bullfighter',
                   'Charlotte Löwensköld',
                   'Defining Moments',
                   'Der Schuh des Manitu',
                   'Enchanted',
                   'French Kiss',
                   'In extremis',
                   'Last Train Home',
                   'Mawaru meido in Wario',
                   'Millennium',
                   'Rascals',
                   'Roxanne',
                   'Siege',
                   'Stephanie',
                   'The 55th Annual Grammy Awards',
                   'The New Car',
                   'The Power of Few',
                   'The Stud',
                   'The Unknown',
                   'To tama',
                   'Tom Hanks',
                   'Welcome to the Club')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND rt.role IN ('editor')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('7')
     AND mi1.info IN ('CAM:Arri Alexa',
                    'CAM:Canon 5D Mark II',
                    'CAM:Canon XL-1',
                    'LAB:Fotofilm S.A., Madrid, Spain',
                    'LAB:Technicolor',
                    'MET:500 m',
                    'OFM:35 mm',
                    'PCS:Digital',
                    'PCS:Shawscope',
                    'PFM:70 mm',
                    'PFM:DCP',
                    'RAT:1.44 : 1'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');