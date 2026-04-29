WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('based-on-novel',
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
                     'violence'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('3')
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
                    'RAT:2.35 : 1')
  AND rt.role IN ('director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);