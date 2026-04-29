WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game')),
     filtered_mi1 AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color')),
     filtered_mi2 AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('105')
     AND mi.info IN ('$1,000,000',
                    '$1,500',
                    '$15,000',
                    '$2,000',
                    '$200,000',
                    '$25,000',
                    '$5,000',
                    '$5,000,000',
                    '$50,000',
                    '$75,000',
                    '£10,000')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('actress',
                   'editor'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id;