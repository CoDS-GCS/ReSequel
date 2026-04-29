WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('tv movie',
                   'video game')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('amputating-someones-leg',
                     'avant-garde',
                     'death-row',
                     'facing-fear',
                     'farenheit',
                     'feces-poured-on-someone',
                     'fingernails-painting',
                     'israeli-father',
                     'kibei',
                     'mole-removal',
                     'morning-coffee',
                     'peloponnese-greece',
                     'phony-doctor',
                     'reference-to-david-cassidy',
                     'reference-to-everyman-the-play',
                     'reference-to-wendys-restaurant',
                     'stripping-in-front-of-a-mirror',
                     'train-set',
                     'uncircumcised-men',
                     'unjustified-invasion')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('editor',
                   'production designer')),
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Short')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('10',
                    '11',
                    '110',
                    '14',
                    '15',
                    '17',
                    '30',
                    '45',
                    '6',
                    '7',
                    '80',
                    'USA:30',
                    'USA:9');