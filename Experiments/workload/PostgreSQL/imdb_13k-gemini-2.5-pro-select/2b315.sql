WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('3')
     AND mi.info IN ('Action',
                    'Adventure',
                    'Drama',
                    'Family',
                    'Music',
                    'Short',
                    'Sport')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info IN ('Czechoslovakia',
                    'Philippines',
                    'Turkey',
                    'UK'))
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
                   'tv movie')
  AND rt.role IN ('production designer')
  AND n.gender IN ('m')
  AND k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'based-on-play',
                     'death',
                     'father-son-relationship',
                     'female-nudity',
                     'friendship',
                     'gay',
                     'hardcore',
                     'hospital',
                     'lesbian',
                     'lesbian-sex',
                     'marriage',
                     'non-fiction',
                     'party',
                     'police',
                     'revenge',
                     'song',
                     'suicide',
                     'surrealism',
                     'violence');