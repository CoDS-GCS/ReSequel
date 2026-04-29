 
 WITH movie_subset AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_subset
INNER JOIN movie_info mi1 ON movie_subset.id = mi1.movie_id
INNER JOIN info_type it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info mi2 ON movie_subset.id = mi2.movie_id
INNER JOIN info_type it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info ci ON movie_subset.id = ci.movie_id
INNER JOIN name n ON ci.person_id = n.id
INNER JOIN role_type rt ON ci.role_id = rt.id
WHERE it1.id IN ('1')
  AND mi1.info IN ('12',
                    '48',
                    '99',
                    'Germany:88',
                    'USA:23',
                    'USA:55',
                    'USA:7')
  AND it2.id IN ('18')
  AND mi2.info IN ('Argentina',
                    'Austin, Texas, USA',
                    'Boston, Massachusetts, USA',
                    'India',
                    'Japan',
                    'Lisbon, Portugal',
                    'New Jersey, USA',
                    'New Orleans, Louisiana, USA',
                    'Phoenix, Arizona, USA',
                    'San Francisco, California, USA')
  AND n.gender IS NULL
  AND rt.role IN ('editor');