WITH filtered_mi1 AS
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('3',
                  '4',
                  '5')
     AND info IN ('Adventure',
                    'Argentina:16',
                    'Canada:G',
                    'Canada:PG',
                    'Cantonese',
                    'Czech',
                    'Finland:K-12',
                    'Germany:12',
                    'Hindi',
                    'Iceland:16',
                    'Iceland:L',
                    'Netherlands:14',
                    'Singapore:PG',
                    'Sport',
                    'Swedish',
                    'UK:PG',
                    'West Germany:12'))
SELECT fmi1.info,
       n.name,
       COUNT(*)
FROM filtered_mi1 AS fmi1
JOIN title AS t ON fmi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON fmi1.movie_id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
  AND rt.role IN ('actress',
                   'costume designer',
                   'producer')
  AND n.name ILIKE '%hu%'
  AND pi.info_type_id IN ('21')
GROUP BY fmi1.info,
         n.name;