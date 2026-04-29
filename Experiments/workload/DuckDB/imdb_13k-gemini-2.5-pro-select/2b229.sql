WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1990
     AND t.production_year <= 2015
     AND kt.kind IN ('tv movie',
                   'tv series')),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Color')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('16')
     AND info IN ('Nigeria:2005',
                    'Nigeria:2006',
                    'USA:1993',
                    'USA:1994',
                    'USA:1995',
                    'USA:1998',
                    'USA:2000',
                    'USA:April 2009')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'based-on-novel',
                     'based-on-play',
                     'character-name-in-title',
                     'doctor',
                     'dog',
                     'family-relationships',
                     'flashback',
                     'gun',
                     'jealousy',
                     'love',
                     'murder',
                     'non-fiction',
                     'nudity',
                     'party',
                     'revenge',
                     'sequel',
                     'song',
                     'tv-mini-series',
                     'violence')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('composer'))
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id;