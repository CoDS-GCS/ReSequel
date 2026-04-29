WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('movie',
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
WHERE rt.role IN ('actress',
                   'director',
                   'editor',
                   'guest',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('5')
  AND mi1.info IN ('Canada:13+',
                    'Canada:G',
                    'Canada:R',
                    'Finland:S',
                    'Germany:16',
                    'Iceland:L',
                    'Norway:18',
                    'Singapore:M18',
                    'Singapore:NC-16',
                    'South Korea:15',
                    'Sweden:11',
                    'UK:U',
                    'West Germany:12',
                    'West Germany:16',
                    'West Germany:o.Al.')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');