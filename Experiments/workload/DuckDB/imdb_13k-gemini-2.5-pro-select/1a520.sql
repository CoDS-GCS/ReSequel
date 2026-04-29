WITH t_mi_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
     AND mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Family',
                   'Musical',
                   'Thriller')
     AND mi2.info_type_id = '5'
     AND mi2.info IN ('Canada:G',
                   'France:U',
                   'Iceland:16',
                   'Italy:T',
                   'New Zealand:R16',
                   'Norway:16',
                   'Norway:18',
                   'Spain:13',
                   'Switzerland:14',
                   'USA:Approved',
                   'USA:PG',
                   'USA:Passed',
                   'USA:Unrated'))
SELECT COUNT(*)
FROM t_mi_filtered AS t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IN ('f',
                   'm')
  AND rt.role IN ('actress',
                  'composer');