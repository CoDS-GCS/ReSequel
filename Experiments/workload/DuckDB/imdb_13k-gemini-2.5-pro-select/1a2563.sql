
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t,
        kind_type AS kt,
        info_type AS it1,
        movie_info AS mi1,
        movie_info AS mi2,
        info_type AS it2,
        cast_info AS ci,
        role_type AS rt,
        name AS n
   WHERE t.id = ci.movie_id
     AND t.id = mi1.movie_id
     AND t.id = mi2.movie_id
     AND mi1.info_type_id = it1.id
     AND mi2.info_type_id = it2.id
     AND t.kind_id = kt.id
     AND ci.person_id = n.id
     AND ci.role_id = rt.id
     AND it1.id IN ('1')
     AND it2.id IN ('18')
     AND mi1.info IN ('141',
                    '43',
                    '74',
                    'Canada:30',
                    'USA:111',
                    'USA:25',
                    'USA:27',
                    'USA:76',
                    'USA:96')
     AND mi2.info IN ('Barcelona, Cataluña, Spain',
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
                    'Winnipeg, Manitoba, Canada')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie')
     AND rt.role IN ('editor',
                   'production designer',
                   'writer')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1925 AND 2015) AS subquery;