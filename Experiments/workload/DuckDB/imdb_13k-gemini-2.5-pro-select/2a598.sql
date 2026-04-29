
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')) AS t
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('cinematographer',
                   'costume designer')
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')) AS ci ON t.id = ci.movie_id
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('2')
   WHERE mi1.info IN ('Black and White',
                    'Color')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('7')
   WHERE mi2.info IN ('MET:100 m',
                    'MET:200 m',
                    'MET:30 m',
                    'MET:900 m',
                    'OFM:16 mm',
                    'PCS:Panavision',
                    'RAT:1.36 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')) AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id;