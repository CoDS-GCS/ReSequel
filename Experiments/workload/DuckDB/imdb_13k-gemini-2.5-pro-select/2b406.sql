WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Color')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Australia:PG',
                    'Finland:K-15',
                    'Germany:6',
                    'Iceland:12',
                    'India:U',
                    'South Korea:18',
                    'Spain:18',
                    'Switzerland:12',
                    'Switzerland:7'))
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor')
  AND n.gender IN ('m')
  AND k.keyword IN ('alaska',
                     'dominican',
                     'lightning-chaser',
                     'political-party',
                     'pro-golfer',
                     'shilling',
                     't.e.-lawrence',
                     'urban-renewal');