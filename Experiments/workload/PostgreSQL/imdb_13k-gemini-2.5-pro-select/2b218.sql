WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('cigarette-smoking',
                     'dancing',
                     'dog',
                     'family-relationships',
                     'gay',
                     'homosexual',
                     'kidnapping',
                     'male-frontal-nudity',
                     'murder',
                     'police'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('English')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2007',
                    'USA:2008',
                    'USA:2009',
                    'USA:2010',
                    'USA:2013')
  AND rt.role IN ('cinematographer',
                   'costume designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);