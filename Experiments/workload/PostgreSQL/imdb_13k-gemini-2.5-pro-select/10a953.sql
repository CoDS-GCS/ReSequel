WITH filtered_n AS
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%menez%'),
     filtered_mi AS
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('2',
                  '4',
                  '6')
     AND info IN ('Color',
                    'Portuguese'))
SELECT fn.name,
       fmi.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS fn ON ci.person_id = fn.id
JOIN filtered_mi AS fmi ON t.id = fmi.movie_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'costume designer'))
GROUP BY fn.name,
         fmi.info;