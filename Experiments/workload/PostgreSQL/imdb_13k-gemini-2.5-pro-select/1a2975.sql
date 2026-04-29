WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:Atp',
                    'Canada:14A',
                    'Canada:18+',
                    'India:U',
                    'Netherlands:12',
                    'Netherlands:18',
                    'Portugal:M/18',
                    'UK:15',
                    'UK:X',
                    'USA:PG-13',
                    'West Germany:6')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Austria',
                    'Belgium',
                    'India',
                    'Italy',
                    'Mexico',
                    'Netherlands',
                    'Spain',
                    'Sweden',
                    'Switzerland',
                    'USA',
                    'West Germany');