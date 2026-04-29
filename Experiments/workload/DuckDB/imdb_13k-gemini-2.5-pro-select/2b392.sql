
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'Berlin, Germany',
                    'Los Angeles, California, USA',
                    'Mexico',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 17, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Vancouver, British Columbia, Canada')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
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
                     'suicide'));