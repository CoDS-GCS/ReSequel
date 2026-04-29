WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'Berlin, Germany',
                    'Los Angeles, California, USA',
                    'Mexico',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 17, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Vancouver, British Columbia, Canada')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1'))
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
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('f')
  AND k.keyword IN ('bare-breasts',
                     'cigarette-smoking',
                     'doctor',
                     'dog',
                     'family-relationships',
                     'female-nudity',
                     'friendship',
                     'gay',
                     'gun',
                     'hospital',
                     'interview',
                     'kidnapping',
                     'male-nudity',
                     'new-york-city',
                     'non-fiction',
                     'oral-sex',
                     'party',
                     'police',
                     'song',
                     'suicide');