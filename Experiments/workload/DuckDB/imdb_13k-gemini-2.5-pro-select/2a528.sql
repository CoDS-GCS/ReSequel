WITH filtered_t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   AND mi1.info_type_id IN ('2')
   AND mi1.info IN ('Black and White',
                    'Color')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   AND mi2.info_type_id IN ('5')
   AND mi2.info IN ('Australia:G',
                    'Belgium:KT',
                    'Canada:G',
                    'Finland:(Banned)',
                    'Germany:BPjM Restricted',
                    'Portugal:M/18',
                    'Spain:T',
                    'Sweden:Btl',
                    'UK:12',
                    'UK:A',
                    'USA:PG-13',
                    'USA:TV-G',
                    'West Germany:12',
                    'West Germany:16')
   WHERE kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND t.production_year BETWEEN 1950 AND 1990)
SELECT COUNT(*)
FROM filtered_t_mi
JOIN cast_info AS ci ON filtered_t_mi.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON filtered_t_mi.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE rt.role IN ('miscellaneous crew',
                   'producer')
  AND n.gender IS NULL;