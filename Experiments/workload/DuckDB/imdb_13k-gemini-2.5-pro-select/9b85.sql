WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE n.name ILIKE '%jürg%'
     AND it2.id IN ('26'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM filtered_persons AS fp
JOIN cast_info AS ci ON fp.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer')
  AND t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND mi1.info IN ('France',
                    'French',
                    'Italy',
                    'Switzerland',
                    'USA')
  AND it1.id IN ('2',
                  '4',
                  '8')
GROUP BY mi1.info,
         fp.name;