WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('3')
     AND mi.info IN ('Action',
                    'Adult',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Drama',
                    'History',
                    'Horror',
                    'Music',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Sport'))
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'producer')
  AND n.gender IN ('f',
                    'm')
  AND k.keyword IN ('gay',
                     'gun',
                     'interview',
                     'kidnapping',
                     'mother-daughter-relationship',
                     'number-in-title',
                     'oral-sex',
                     'party',
                     'singing',
                     'tv-mini-series');