
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')) AS t_filtered
WHERE EXISTS
    (SELECT 1
     FROM movie_info mi1
     WHERE mi1.movie_id = t_filtered.id
       AND mi1.info_type_id IN ('17')
       AND mi1.info IN ('Original French title is undetermined.'))
  AND EXISTS
    (SELECT 1
     FROM movie_info mi2
     WHERE mi2.movie_id = t_filtered.id
       AND mi2.info_type_id IN ('6')
       AND mi2.info IN ('Silent'))
  AND EXISTS
    (SELECT 1
     FROM cast_info ci
     JOIN name n ON ci.person_id = n.id
     JOIN role_type rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t_filtered.id
       AND n.gender IN ('f',
                    'm')
       AND rt.role IN ('editor',
                   'writer'))
  AND EXISTS
    (SELECT 1
     FROM movie_keyword mk
     WHERE mk.movie_id = t_filtered.id);