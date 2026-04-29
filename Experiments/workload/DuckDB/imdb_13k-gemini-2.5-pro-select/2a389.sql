WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     filtered_cast AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('writer')
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')),
     filtered_info1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('16')
   WHERE mi1.info IN ('Nigeria:2005',
                    'Nigeria:2006',
                    'USA:1994',
                    'USA:1995',
                    'USA:1997',
                    'USA:1998',
                    'USA:2000',
                    'USA:April 2009')),
     filtered_info2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('2')
   WHERE mi2.info IN ('Color'))
SELECT COUNT(*)
FROM filtered_titles AS ft
JOIN filtered_cast AS fc ON ft.id = fc.movie_id
JOIN filtered_info1 AS fi1 ON ft.id = fi1.movie_id
JOIN filtered_info2 AS fi2 ON ft.id = fi2.movie_id
JOIN movie_keyword AS mk ON ft.id = mk.movie_id;