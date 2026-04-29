WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'bare-chested-male',
                     'father-daughter-relationship',
                     'female-nudity',
                     'fight',
                     'friendship',
                     'homosexual',
                     'husband-wife-relationship',
                     'lesbian-sex',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'non-fiction',
                     'number-in-title',
                     'one-word-title',
                     'revenge',
                     'sex',
                     'tv-mini-series',
                     'violence'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('Argentina',
                    'London, England, UK',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Rome, Lazio, Italy',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Vancouver, British Columbia, Canada')
  AND it2.id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Dolby',
                    'Mono',
                    'Stereo')
  AND rt.role IN ('production designer')
  AND n.gender IN ('m');