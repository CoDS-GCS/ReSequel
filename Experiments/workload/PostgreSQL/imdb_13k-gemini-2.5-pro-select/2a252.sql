 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('movie',
                   'video movie')) AS t
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('writer')
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')) AS ci ON t.id = ci.movie_id
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('8')
   WHERE mi1.info IN ('France',
                    'Germany',
                    'Italy',
                    'Spain',
                    'UK',
                    'USA')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('7')
   WHERE mi2.info IN ('LAB:DeLuxe',
                    'MET:300 m',
                    'OFM:35 mm',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')) AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id;