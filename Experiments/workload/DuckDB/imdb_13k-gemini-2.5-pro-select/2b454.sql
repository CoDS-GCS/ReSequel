WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'video movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('aborted-fetus',
                     'betting-ones-life',
                     'chess-board',
                     'chinese-food',
                     'coca-cola-company',
                     'corn-candy',
                     'elderly',
                     'hefner',
                     'hope-diamond',
                     'leningrad-blockade',
                     'lou-gehrigs-disease',
                     'magic-marker',
                     'old-injury',
                     'old-world-custom',
                     'plan-d',
                     'radioactive-man',
                     'red-pirates-of-the-prairies',
                     'rock-band-reunion',
                     'secret-cellar',
                     'skweee',
                     'sold-into-marriage',
                     'train-supervisor')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer',
                   'editor')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL)
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_k ON mk.keyword_id = filtered_k.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN filtered_n ON ci.person_id = filtered_n.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'USA')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Boston, Massachusetts, USA',
                    'Buenos Aires, Federal District, Argentina');