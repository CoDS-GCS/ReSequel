
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND mi1.info IN ('Catalan',
                    'Czech',
                    'Dutch',
                    'English',
                    'Greek',
                    'Norwegian',
                    'Portuguese',
                    'Russian',
                    'Turkish')
  AND mi2.info IN ('Brazil',
                    'Czech Republic',
                    'Greece',
                    'India',
                    'Japan',
                    'Netherlands',
                    'Norway',
                    'Portugal',
                    'Russia',
                    'Spain',
                    'Turkey',
                    'UK')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('8')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('destiny',
                     'dum-dum-boys',
                     'emergancy-exit',
                     'flat-hunting',
                     'historical-location',
                     'hit-by-truck',
                     'lack-of-responsibility',
                     'male-sitting-on-a-toilet',
                     'marie-von-ebner-eschenbach-quotation',
                     'massaging-someones-leg',
                     'mobile-home',
                     'reference-to-cacciaguida',
                     'technical-theatre',
                     'tv-store'));