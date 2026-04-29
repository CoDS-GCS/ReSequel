WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('break-even',
                     'christmas-ball',
                     'dead-boy',
                     'high-iq',
                     'horace-tapscott',
                     'land-theft',
                     'man-with-no-pants',
                     'menominie-wisconsin',
                     'mystical-vision',
                     'power-door-lock',
                     'robin-hood-spoof',
                     'sex-on-plane',
                     'silver-plated-tooth',
                     'snowy-owl',
                     'social-ministry',
                     'swim-therapy',
                     'third-grade-teacher',
                     'woman-in-coffin'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Adult',
                    'Documentary',
                    'Drama')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Austria',
                    'Italy',
                    'Sweden',
                    'UK')
  AND rt.role IN ('cinematographer',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);