
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('f',
                   'm')
  AND rt.role IN ('composer',
                  'costume designer')
  AND t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '8'
  AND mi1.info IN ('Argentina',
                   'Canada',
                   'Germany',
                   'India',
                   'Iran',
                   'Japan',
                   'Netherlands',
                   'Philippines',
                   'Poland',
                   'Soviet Union')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Dutch',
                   'English',
                   'Filipino',
                   'Hindi',
                   'Persian',
                   'Polish',
                   'Russian',
                   'Spanish');