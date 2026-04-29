WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.107)',
                   '(#2.36)',
                   '(#2.7)',
                   '(#3.6)',
                   'Among Those Present',
                   'Another Thin Man',
                   'Betrayed',
                   'Crossfire',
                   'Devils Island',
                   'Eyewitness',
                   'Happy Days',
                   'His Brothers Keeper',
                   'Lost and Found',
                   'Meet John Doe',
                   'Million Dollar Mermaid',
                   'Only Yesterday',
                   'Scandal Sheet',
                   'Somebody Up There Likes Me',
                   'Stowaway',
                   'Thats the Spirit',
                   'The Country Doctor',
                   'The Fugitives',
                   'The Gamble',
                   'The Gambler',
                   'The Great Train Robbery',
                   'The Kid from Texas',
                   'The Lost City',
                   'The Visitor',
                   'Tom Sawyer',
                   'Tommy',
                   'Uncle Toms Cabin',
                   'Vice Versa')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'costume designer',
                   'miscellaneous crew',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('17')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original French title is undetermined.');