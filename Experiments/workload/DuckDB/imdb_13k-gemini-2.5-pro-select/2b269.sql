WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Live',
                    'PFM:35 mm',
                    'RAT:1.37 : 1')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('10',
                    '110',
                    '72',
                    '73',
                    '74',
                    '89',
                    '91',
                    '93',
                    '97',
                    '98',
                    'Argentina:30',
                    'USA:60',
                    'USA:70')
  AND n.gender IN ('f')
  AND rt.role IN ('composer')
  AND k.keyword IN ('bare-breasts',
                     'based-on-novel',
                     'based-on-play',
                     'flashback',
                     'gay',
                     'kidnapping',
                     'lesbian',
                     'male-nudity',
                     'mother-son-relationship',
                     'number-in-title',
                     'police',
                     'singing',
                     'surrealism');