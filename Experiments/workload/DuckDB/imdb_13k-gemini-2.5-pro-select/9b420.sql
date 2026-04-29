WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE n.name ILIKE '%fi%'
     AND it2.id IN ('33'))
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
                   'costume designer',
                   'producer')
  AND t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
  AND mi1.info IN ('Algeria',
                    'Bosnia and Herzegovina',
                    'Bulgaria',
                    'China',
                    'Cuba',
                    'Cyprus',
                    'East Germany',
                    'Finland',
                    'Indonesia',
                    'Lebanon',
                    'Luxembourg',
                    'Morocco',
                    'Pakistan',
                    'Puerto Rico',
                    'Republic of Macedonia',
                    'Singapore',
                    'South Korea',
                    'Tunisia')
  AND it1.id IN ('8')
GROUP BY mi1.info,
         fp.name;