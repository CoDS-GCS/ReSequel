
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'Canada',
                    'France',
                    'Japan',
                    'Spain',
                    'UK',
                    'USA')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'SDDS',
                    'Stereo')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('autistic-savant',
                     'boy-prince',
                     'climbing-a-road-sign',
                     'davis',
                     'deceitful-wife',
                     'hood-ornament',
                     'implied-blow-job',
                     'minimum-security-prison',
                     'nitrogen',
                     'panic-in-city',
                     'post-revolution',
                     'raising-ones-arms-into-the-air',
                     'serenade',
                     'silver-statue',
                     'vintage'));