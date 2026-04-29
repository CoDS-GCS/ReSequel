 
 WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
     AND t.production_year BETWEEN 1990 AND 2015),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IS NULL
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('cinematographer')),
     filtered_mi1 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('4')
     AND info IN ('Cantonese',
                    'Dutch',
                    'English',
                    'French',
                    'German',
                    'Hindi',
                    'Mandarin',
                    'Portuguese',
                    'Russian')),
     filtered_mi2 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('6')
     AND info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo',
                    'Ultra Stereo'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id;