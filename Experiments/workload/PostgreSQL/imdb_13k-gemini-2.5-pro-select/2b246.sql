WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('Argentina',
                    'India',
                    'Netherlands',
                    'Sweden',
                    'UK',
                    'USA')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('Amsterdam, Noord-Holland, Netherlands',
                    'Argentina',
                    'England, UK',
                    'India',
                    'Minneapolis, Minnesota, USA',
                    'Nashville, Tennessee, USA',
                    'North Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stockholm, Stockholms län, Sweden'))
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
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('writer')
  AND n.gender IN ('f')
  AND k.keyword IN ('bare-breasts',
                     'blood',
                     'doctor',
                     'father-daughter-relationship',
                     'hardcore',
                     'jealousy',
                     'kidnapping',
                     'lesbian',
                     'number-in-title',
                     'singing',
                     'song',
                     'surrealism',
                     'tv-mini-series');