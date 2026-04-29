WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('tv series',
                   'video game',
                   'video movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('based-on-novel',
                     'based-on-play',
                     'character-name-in-title',
                     'cigarette-smoking',
                     'doctor',
                     'dog',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'nudity',
                     'oral-sex',
                     'police',
                     'revenge',
                     'singer',
                     'tv-mini-series',
                     'violence')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director')),
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
WHERE t.production_year BETWEEN 1875 AND 1975
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Fantasy',
                    'Music',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Western')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('MET:',
                    'MET:15.2 m',
                    'MET:1500 m',
                    'MET:23 m',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:68 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1');