WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('OFM:35 mm',
                    'OFM:Live',
                    'PFM:35 mm',
                    'RAT:1.37 : 1')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('10',
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
                    'USA:70'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie')
  AND rt.role IN ('composer')
  AND n.gender IN ('f')
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