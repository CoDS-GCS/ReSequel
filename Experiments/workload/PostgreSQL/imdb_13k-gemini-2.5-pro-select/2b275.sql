
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('australian-television',
                     'ccr-mining',
                     'chinese-linking-rings',
                     'church-wedding',
                     'clitoromegaly',
                     'cracked-mirror',
                     'easter',
                     'fort-yuma',
                     'gagliano-italy',
                     'injection-under-tongue',
                     'iodine',
                     'knife-in-vagina',
                     'lakota',
                     'livingston-texas',
                     'lucky-charm',
                     'mass-murder-in-dream',
                     'musical-overture',
                     'new-zealander',
                     'pretoria-south-africa',
                     'rebuilding-team',
                     'reference-to-bela-lugosi',
                     'reference-to-deutschland',
                     'sex-with-a-goat',
                     'tagliacozzo-italy',
                     'u.s.-invasion')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:13',
                    'France:-16',
                    'Germany:6',
                    'Italy:VM18',
                    'Netherlands:16',
                    'Philippines:R-18',
                    'Switzerland:10',
                    'Switzerland:16',
                    'UK:X',
                    'USA:TV-PG')
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')
  AND rt.role IN ('costume designer',
                   'director')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);