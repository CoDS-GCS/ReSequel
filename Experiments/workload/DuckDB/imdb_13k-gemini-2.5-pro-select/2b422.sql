WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Australia:M',
                    'Finland:K-11',
                    'Germany:6',
                    'Hong Kong:IIB',
                    'Italy:T',
                    'Italy:VM14',
                    'Philippines:R-18',
                    'Singapore:PG',
                    'Sweden:15',
                    'Switzerland:10',
                    'Switzerland:16',
                    'Switzerland:7')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English',
                    'French',
                    'German',
                    'Tagalog'))
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
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('editor')
  AND n.gender IN ('f',
                    'm')
  AND k.keyword IN ('based-on-play',
                     'blood',
                     'character-name-in-title',
                     'female-frontal-nudity',
                     'female-nudity',
                     'gay',
                     'homosexual',
                     'hospital',
                     'husband-wife-relationship',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'number-in-title',
                     'party',
                     'police',
                     'revenge',
                     'singer',
                     'surrealism',
                     'tv-mini-series',
                     'violence');