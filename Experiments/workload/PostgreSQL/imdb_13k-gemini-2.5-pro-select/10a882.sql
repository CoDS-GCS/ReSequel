WITH relevant_people AS
  (SELECT n.id AS person_id,
          n.name,
          ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.name ILIKE '%cay%'
     AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'costume designer'))
SELECT rp.name,
       mi1.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM relevant_people AS rp
JOIN title AS t ON rp.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
WHERE kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND mi1.info IN ('Color')
  AND it1.id IN ('2',
                  '6')
GROUP BY rp.name,
         mi1.info;