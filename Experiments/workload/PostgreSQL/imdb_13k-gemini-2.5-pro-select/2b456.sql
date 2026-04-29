
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     movie_info AS mi2,
     cast_info AS ci,
     movie_keyword AS mk
WHERE t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND t.production_year BETWEEN 1950 AND 2010
  AND mi1.info IN ('Biography',
                    'Drama',
                    'Fantasy',
                    'History',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Romance',
                    'Sci-Fi',
                    'Sport',
                    'War')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('6')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'blood',
                     'character-name-in-title',
                     'father-daughter-relationship',
                     'female-frontal-nudity',
                     'gun',
                     'interview',
                     'love',
                     'murder',
                     'party',
                     'song',
                     'tv-mini-series',
                     'violence'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL);