
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info IN ('Austin, Texas, USA',
                    'Berlin, Germany',
                    'Brooklyn, New York City, New York, USA',
                    'California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Manhattan, New York City, New York, USA',
                    'Melbourne, Victoria, Australia',
                    'New York City, New York, USA',
                    'Toronto, Ontario, Canada',
                    'USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND mi2.info IN ('Australia',
                    'Germany',
                    'USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('8')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('chef',
                     'ex-political-prisoner',
                     'hydrocortisone',
                     'intelligentsia',
                     'jammed-door',
                     'money-carrier',
                     'quechua-indians',
                     'reference-to-jack-smith',
                     'roof-terrace',
                     'smoking',
                     'spaceshipone',
                     'stave',
                     'teenage-dancer',
                     'urban-sprawl'));