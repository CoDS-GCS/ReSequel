WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
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
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'production designer',
                   'writer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND it1.id IN ('16')
  AND mi1.info IN ('France:1908',
                    'France:1909',
                    'France:1910',
                    'Italy:1913',
                    'USA:January 1903')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Belgium',
                    'Brazil',
                    'Canada',
                    'Czechoslovakia',
                    'Germany',
                    'Italy',
                    'Mexico',
                    'Norway',
                    'Pakistan',
                    'Soviet Union',
                    'Turkey',
                    'UK');