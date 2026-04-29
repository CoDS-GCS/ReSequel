WITH filtered_ci AS
  (SELECT person_id,
          movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'producer',
                   'production designer')),
     filtered_people AS
  (SELECT n.id AS person_id,
          pi.info
   FROM name n
   JOIN person_info pi ON n.id = pi.person_id
   JOIN info_type it ON pi.info_type_id = it.id
   WHERE it.id IN ('21')
     AND pi.info ILIKE '%no%'),
     filtered_movies AS
  (SELECT t.id AS movie_id,
          mi.info
   FROM title t
   JOIN movie_info mi ON t.id = mi.movie_id
   JOIN info_type it ON mi.info_type_id = it.id
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE it.id IN ('16')
     AND mi.info ILIKE '%ph%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'video movie'))
SELECT fm.info,
       fp.info,
       COUNT(*)
FROM filtered_ci fci
JOIN filtered_people fp ON fci.person_id = fp.person_id
JOIN filtered_movies fm ON fci.movie_id = fm.movie_id
GROUP BY fm.info,
         fp.info;