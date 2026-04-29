WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'video movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('blowing',
                     'brookhaven-laboratory',
                     'burning-vehicle',
                     'card-trick',
                     'come-from-behind-race',
                     'credits',
                     'eddie-foy',
                     'exploding-planet',
                     'marriage-between-uncle-and-niece',
                     'money-tree',
                     'painting-over-wallpaper',
                     'policeman-smoking-pot',
                     'pretending-to-shoot-a-gun',
                     'reference-to-leslie-nielsen',
                     'safety-equipment-failure',
                     'three-jobs-at-one-time',
                     'vulcanization')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
                   'writer')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('English')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:1993',
                    'USA:1994',
                    'USA:1999',
                    'USA:2000',
                    'USA:2012');