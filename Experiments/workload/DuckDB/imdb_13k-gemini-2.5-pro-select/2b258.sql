WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('blood',
                     'father-daughter-relationship',
                     'homosexual',
                     'hospital',
                     'interview',
                     'lesbian-sex',
                     'male-nudity',
                     'number-in-title',
                     'party'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'PCS:Digital Intermediate',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'PFM:Digital',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Canada',
                    'Germany',
                    'India',
                    'Japan',
                    'Spain',
                    'USA')
  AND rt.role IN ('director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);