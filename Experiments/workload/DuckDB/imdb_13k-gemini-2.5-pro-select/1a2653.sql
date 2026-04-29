
SELECT COUNT(*)
FROM
  (SELECT id,
          kind_id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975) AS t
JOIN
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie')) AS kt ON t.kind_id = kt.id
JOIN
  (SELECT movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'editor')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)) AS ci ON t.id = ci.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info mi
   JOIN info_type it ON mi.info_type_id = it.id
   WHERE it.id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info mi
   JOIN info_type it ON mi.info_type_id = it.id
   WHERE it.id IN ('4')
     AND mi.info IN ('Cantonese',
                    'Danish',
                    'Dutch',
                    'Filipino',
                    'Finnish',
                    'French',
                    'Hindi',
                    'Italian',
                    'Mandarin',
                    'None',
                    'Persian',
                    'Polish',
                    'Spanish',
                    'Swedish',
                    'Turkish')) AS mi2 ON t.id = mi2.movie_id;