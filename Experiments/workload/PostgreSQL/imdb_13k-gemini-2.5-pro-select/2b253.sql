WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('anal-sex',
                     'death',
                     'family-relationships',
                     'female-frontal-nudity',
                     'fight',
                     'friendship',
                     'gay',
                     'gun',
                     'jealousy',
                     'lesbian',
                     'love',
                     'male-nudity',
                     'nudity',
                     'one-word-title',
                     'party',
                     'revenge',
                     'sex',
                     'singing',
                     'suicide')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
                   'miscellaneous crew')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL)
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_k ON mk.keyword_id = filtered_k.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN filtered_n ON ci.person_id = filtered_n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Live',
                    'PFM:35 mm',
                    'RAT:1.33 : 1')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'New York City, New York, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA');