WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.50)',
                   '(#2.36)',
                   '(#5.8)',
                   'A Midsummer Nights Dream',
                   'April Fool',
                   'Arrival',
                   'Barbary Coast',
                   'Bells Are Ringing',
                   'Born to Be Bad',
                   'Citizen Kane',
                   'Dansk melodi grand prix',
                   'George Whites 1935 Scandals',
                   'It Happened One Night',
                   'Last Chance',
                   'Law and Order',
                   'Lilith',
                   'Love and Marriage',
                   'Mildred Pierce',
                   'Moral',
                   'Oceans Eleven',
                   'Pursuit',
                   'Rich Man, Poor Man',
                   'Sechster Teil',
                   'Stagecoach',
                   'Sweet Charity',
                   'The Importance of Being Earnest',
                   'The Noose',
                   'The Oscar',
                   'The Outcast',
                   'The Phantom of the Opera',
                   'The Photographer',
                   'The Red Shoes',
                   'The Soldier',
                   'The Warning',
                   'True Confession',
                   'Whistling in the Dark')
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
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('5')
  AND mi2.info_type_id IN ('1')
  AND mi1.info IN ('Canada:PG',
                    'Finland:K-16',
                    'Germany:16',
                    'Norway:16',
                    'Norway:18',
                    'Spain:T',
                    'Sweden:Btl',
                    'UK:AA',
                    'UK:PG',
                    'USA:G',
                    'USA:TV-PG',
                    'West Germany:16',
                    'West Germany:18')
  AND mi2.info IN ('102',
                    '105',
                    '107',
                    '109',
                    '113',
                    '115',
                    '51',
                    '75',
                    '8',
                    '82',
                    '93',
                    '97',
                    '98',
                    'USA:30',
                    'USA:90');