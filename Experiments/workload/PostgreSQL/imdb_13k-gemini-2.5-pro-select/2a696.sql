 
 WITH filtered_mi1 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('5')
     AND info IN ('Argentina:Atp',
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
                    'USA:TV-PG')),
     filtered_mi2 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('6')
     AND info IN ('DTS',
                    'Dolby Digital',
                    'Mono',
                    'SDDS',
                    'Stereo'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('costume designer')
  AND n.gender IS NULL;