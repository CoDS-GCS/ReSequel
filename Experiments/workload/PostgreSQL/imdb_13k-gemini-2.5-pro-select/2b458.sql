
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
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Mono',
                    'Silent')
  AND mi2.info IN ('Belgium',
                    'France',
                    'Germany',
                    'India',
                    'Japan',
                    'Soviet Union',
                    'UK',
                    'USA',
                    'West Germany',
                    'Yugoslavia')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('8')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-novel',
                     'blood',
                     'female-nudity',
                     'gay',
                     'husband-wife-relationship',
                     'revenge',
                     'singing'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);