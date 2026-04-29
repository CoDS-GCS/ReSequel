WITH filtered_movies AS MATERIALIZED
  (SELECT t.id, mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND it1.id IN ('8')
     AND mi1.info IN ('Austria',
                    'Belgium',
                    'Colombia',
                    'Cuba',
                    'India',
                    'Iran',
                    'Ireland',
                    'Israel',
                    'Netherlands',
                    'Puerto Rico',
                    'Romania',
                    'Switzerland')),
     filtered_persons AS MATERIALIZED
  (SELECT n.id, n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE n.name ILIKE '%mora%'
     AND it2.id IN ('24'))
SELECT fm.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'costume designer')
GROUP BY fm.info,
         fp.name;