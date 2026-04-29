
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
  AND t.production_year BETWEEN 1990 AND 2015
  AND mi1.info IN ('Dolby Digital',
                    'SDDS')
  AND mi2.info IN ('Netherlands:12',
                    'Norway:15',
                    'Singapore:PG',
                    'Switzerland:12',
                    'USA:Not Rated',
                    'USA:PG',
                    'USA:PG-13',
                    'USA:R',
                    'USA:X')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('5')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('cigarette-smoking',
                     'dancing',
                     'death',
                     'doctor',
                     'friendship',
                     'hardcore',
                     'hospital',
                     'independent-film',
                     'interview',
                     'jealousy',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-son-relationship',
                     'non-fiction',
                     'number-in-title',
                     'suicide',
                     'violence'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);