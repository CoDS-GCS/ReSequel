
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
  AND mi1.info IN ('Action',
                    'Documentary',
                    'Drama',
                    'Sci-Fi')
  AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Mexico',
                    'Paris, France',
                    'Vancouver, British Columbia, Canada')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('18')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'father-son-relationship',
                     'hardcore',
                     'lesbian-sex',
                     'sequel'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL);