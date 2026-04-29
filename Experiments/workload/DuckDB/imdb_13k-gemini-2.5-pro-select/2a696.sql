WITH filtered_t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   AND mi1.info_type_id IN ('5')
   AND mi1.info IN ('Argentina:Atp',
                    'Australia:G',
                    'Belgium:KT',
                    'France:U',
                    'Germany:16',
                    'Netherlands:12',
                    'Norway:15',
                    'South Korea:18',
                    'UK:15',
                    'USA:G',
                    'USA:PG-13',
                    'USA:R',
                    'USA:TV-PG')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   AND mi2.info_type_id IN ('6')
   AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Mono',
                    'SDDS',
                    'Stereo')
   WHERE kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
     AND t.production_year BETWEEN 1925 AND 2015)
SELECT COUNT(*)
FROM filtered_t_mi
JOIN cast_info AS ci ON filtered_t_mi.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON filtered_t_mi.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE rt.role IN ('costume designer')
  AND n.gender IS NULL;