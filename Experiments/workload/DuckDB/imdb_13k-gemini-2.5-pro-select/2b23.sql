WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English',
                    'Italian',
                    'Japanese',
                    'Swedish')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('18')
     AND mi.info IN ('Baltimore, Maryland, USA',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'India',
                    'Japan',
                    'Orlando, Florida, USA',
                    'Stage 25, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 27, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 28A, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 5, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stockholm, Stockholms län, Sweden',
                    'Studio 33, CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Studio 8H, NBC Studios - 30 Rockefeller Plaza, Manhattan, New York City, New York, USA',
                    'UK',
                    'Winnipeg, Manitoba, Canada'))
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
  AND rt.role IN ('producer')
  AND n.gender IN ('f')
  AND k.keyword IN ('bare-breasts',
                     'doctor',
                     'fight',
                     'friendship',
                     'hardcore',
                     'hospital',
                     'independent-film',
                     'interview',
                     'kidnapping',
                     'male-frontal-nudity',
                     'non-fiction',
                     'oral-sex',
                     'revenge',
                     'singing');