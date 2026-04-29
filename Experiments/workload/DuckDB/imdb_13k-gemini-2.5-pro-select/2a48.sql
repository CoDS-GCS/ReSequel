
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv series',
                   'video game')
  AND it1.id IN ('4')
  AND mi1.info IN ('English',
                    'French',
                    'Hindi',
                    'Portuguese',
                    'Spanish')
  AND it2.id IN ('5')
  AND mi2.info IN ('Brazil:12',
                    'Chile:14',
                    'Finland:K-12',
                    'India:A',
                    'Peru:PT',
                    'Portugal:M/12',
                    'Spain:18',
                    'Spain:T',
                    'Sweden:Btl',
                    'Switzerland:7',
                    'USA:E',
                    'USA:M',
                    'USA:TV-Y7')
  AND rt.role IN ('editor')
  AND n.gender IN ('m');