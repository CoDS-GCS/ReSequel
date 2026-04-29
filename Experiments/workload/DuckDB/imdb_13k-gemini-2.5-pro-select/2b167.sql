WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Argentina:13',
                    'Australia:M',
                    'Portugal:M/12',
                    'Singapore:PG',
                    'UK:15',
                    'USA:Not Rated',
                    'USA:R')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('Los Angeles, California, USA',
                    'New York City, New York, USA'))
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('director')
  AND n.gender IN ('f')
  AND k.keyword IN ('bare-chested-male',
                     'blood',
                     'dancing',
                     'doctor',
                     'family-relationships',
                     'father-daughter-relationship',
                     'gay',
                     'gun',
                     'husband-wife-relationship',
                     'independent-film',
                     'interview',
                     'murder',
                     'number-in-title',
                     'party',
                     'revenge',
                     'sequel',
                     'singer',
                     'violence');