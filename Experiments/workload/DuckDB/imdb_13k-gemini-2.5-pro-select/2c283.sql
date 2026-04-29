WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.373)',
                   '(#1.835)',
                   '(#4.18)',
                   '(#5.21)',
                   'A Christmas Story',
                   'A Class Act',
                   'A Hard Days Night',
                   'Breakout',
                   'Crime of Passion',
                   'Flash Point',
                   'Night of 100 Stars III',
                   'Pepe',
                   'Queen for a Day',
                   'Robert Kennedy & His Times',
                   'Six Bridges to Cross',
                   'Stella',
                   'The Apple',
                   'The Believers',
                   'The Wanderers',
                   'World of Sport')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('5')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('Argentina:Atp',
                    'Australia:PG',
                    'Canada:13+',
                    'Canada:R',
                    'Finland:K-18',
                    'Germany:16',
                    'Germany:18',
                    'Iceland:L',
                    'India:U',
                    'Sweden:11',
                    'Sweden:7',
                    'UK:12',
                    'UK:18',
                    'UK:PG')
  AND mi2.info IN ('Canada',
                    'India',
                    'Italy',
                    'Norway',
                    'Philippines',
                    'Soviet Union',
                    'UK',
                    'USA');