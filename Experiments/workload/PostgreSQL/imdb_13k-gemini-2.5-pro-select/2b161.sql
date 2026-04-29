WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-breasts',
                     'father-daughter-relationship',
                     'friendship',
                     'one-word-title',
                     'police',
                     'singer'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:Unrated',
                    'Australia:MA',
                    'Australia:R',
                    'Canada:G',
                    'Chile:14',
                    'Finland:K-15',
                    'Mexico:B',
                    'Singapore:M18',
                    'South Korea:All',
                    'Sweden:15',
                    'Switzerland:12',
                    'USA:PG')
  AND rt.role IN ('production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);