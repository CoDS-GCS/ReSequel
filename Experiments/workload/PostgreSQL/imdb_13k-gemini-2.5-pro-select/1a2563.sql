 
 WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie')),
     filtered_mi1 AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('1')
     AND mi.info IN ('141',
                    '43',
                    '74',
                    'Canada:30',
                    'USA:111',
                    'USA:25',
                    'USA:27',
                    'USA:76',
                    'USA:96')),
     filtered_mi2 AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('18')
     AND mi.info IN ('Barcelona, Cataluña, Spain',
                    'Boston, Massachusetts, USA',
                    'Budapest, Hungary',
                    'Buenos Aires, Federal District, Argentina',
                    'Detroit, Michigan, USA',
                    'Dublin, County Dublin, Ireland',
                    'Houston, Texas, USA',
                    'Long Beach, California, USA',
                    'Madrid, Spain',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'San Diego, California, USA',
                    'Stage 17, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Winnipeg, Manitoba, Canada')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('editor',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id;