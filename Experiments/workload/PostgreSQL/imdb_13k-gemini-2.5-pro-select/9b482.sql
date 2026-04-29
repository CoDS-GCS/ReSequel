WITH filtered_movies AS MATERIALIZED
  (SELECT t.id, mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND it1.id IN ('5')
     AND mi1.info IN ('Argentina:16',
                    'Argentina:Atp',
                    'Australia:MA',
                    'Australia:PG',
                    'Brazil:Livre',
                    'Finland:K-18',
                    'Germany:16',
                    'Germany:18',
                    'Netherlands:16',
                    'Singapore:M18',
                    'UK:12',
                    'UK:R18',
                    'USA:E',
                    'USA:TV-PG',
                    'USA:Unrated',
                    'USA:X')),
     filtered_persons AS MATERIALIZED
  (SELECT n.id, n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE n.name ILIKE '%za%'
     AND it2.id IN ('38'))
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
                   'composer')
GROUP BY fm.info,
         fp.name;