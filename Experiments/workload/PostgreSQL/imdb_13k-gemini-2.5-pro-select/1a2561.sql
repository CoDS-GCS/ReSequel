 
 WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'guest',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('110',
                    '112',
                    '115',
                    '130',
                    '59',
                    '60',
                    '64',
                    '65',
                    '69',
                    '80',
                    'USA:84',
                    'USA:96')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Argentina:Atp',
                    'France:U',
                    'Germany:12',
                    'Norway:16',
                    'Singapore:PG',
                    'Spain:18',
                    'UK:A',
                    'UK:U',
                    'USA:Approved',
                    'USA:Passed',
                    'USA:TV-PG',
                    'USA:Unrated',
                    'West Germany:16',
                    'West Germany:18');