WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('art-of-seduction',
                     'artophorion',
                     'bernau',
                     'car-hanging-over-the-edge-of-a-canal',
                     'ejaculation-on-anus',
                     'estonian-war-of-independence',
                     'ethnic-conflict',
                     'forbidden-sex',
                     'funnel',
                     'great-gatsby',
                     'hill',
                     'i.-o.-u.',
                     'internal-combustion-engine',
                     'judicial-branch',
                     'military-secret',
                     'nazi-occupied-denmark',
                     'ruger-pistol',
                     'school-parents-association',
                     'sick-person',
                     'telling-someone-to-shut-up',
                     'trapped-in-a-painting',
                     'woman-slaps-man'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('RAT:1.66 : 1',
                    'RAT:1.85 : 1')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Short')
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('f');