 
 WITH filtered_mi AS
  (SELECT movie_id
   FROM movie_info mi
   JOIN info_type it ON mi.info_type_id = it.id
   WHERE (it.id IN ('16')
          AND mi.info IN ('USA:1994',
                    'USA:1995',
                    'USA:2001',
                    'USA:2002',
                    'USA:2004',
                    'USA:2006',
                    'USA:August 2010',
                    'USA:August 2011',
                    'USA:October 2007'))
     OR (it.id IN ('1')
         AND mi.info IN ('110',
                    '119',
                    '27',
                    '40',
                    '53',
                    '69',
                    '84',
                    'UK:120',
                    'USA:101',
                    'USA:109',
                    'USA:12',
                    'USA:3',
                    'USA:70'))
   GROUP BY movie_id
   HAVING COUNT(DISTINCT CASE
                             WHEN it.id IN ('16') THEN 1
                             ELSE 2
                         END) = 2)
SELECT COUNT(*)
FROM title t
JOIN kind_type kt ON t.kind_id = kt.id
JOIN cast_info ci ON t.id = ci.movie_id
JOIN name n ON ci.person_id = n.id
JOIN role_type rt ON ci.role_id = rt.id
JOIN filtered_mi ON t.id = filtered_mi.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game')
  AND n.gender IS NULL
  AND rt.role IN ('cinematographer',
                   'costume designer',
                   'producer',
                   'writer');