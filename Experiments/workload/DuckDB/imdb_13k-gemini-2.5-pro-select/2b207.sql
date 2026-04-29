
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
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('English')
  AND mi2.info IN ('USA:1993',
                    'USA:1995',
                    'USA:1998',
                    'USA:1999',
                    'USA:2001')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('16')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'blood',
                     'character-name-in-title',
                     'cigarette-smoking',
                     'dancing',
                     'dog',
                     'flashback',
                     'friendship',
                     'hospital',
                     'mother-daughter-relationship',
                     'non-fiction',
                     'nudity',
                     'number-in-title',
                     'police',
                     'sequel',
                     'surrealism',
                     'tv-mini-series',
                     'violence'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL);