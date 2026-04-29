WITH mi_comb AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it1.id IN ('3')
     AND it2.id IN ('1')
     AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Short')
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
                    'USA:9'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mi_comb ON t.id = mi_comb.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'video game')
  AND k.keyword IN ('amputating-someones-leg',
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
                     'unjustified-invasion')
  AND rt.role IN ('editor',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);