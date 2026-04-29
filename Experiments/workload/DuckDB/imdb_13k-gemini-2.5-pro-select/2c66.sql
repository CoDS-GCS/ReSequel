WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.28)',
                   '(#1.97)',
                   '(#2.4)',
                   '(#4.24)',
                   '(#5.12)',
                   '(#7.14)',
                   '(#8.1)',
                   'A Star Is Born',
                   'Aida',
                   'Anniversary',
                   'Blood Money',
                   'Compact',
                   'Die Ratten',
                   'Hallo Taxi',
                   'Hit and Run',
                   'Hollywood Without Make-Up',
                   'Home Sweet Home',
                   'Jailhouse Rock',
                   'Lenny',
                   'Little Girl Lost',
                   'Night Club',
                   'Reunion',
                   'Skin Deep',
                   'The Big Gamble',
                   'The Caddy',
                   'The Cats-Paw',
                   'The Condemned',
                   'The Gun',
                   'The Helping Hand',
                   'The Innocent',
                   'The Legacy',
                   'The Mark of Zorro',
                   'The Soldier',
                   'The Song of Bernadette',
                   'The Squaw Man',
                   'Under Suspicion',
                   'Vendetta')
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
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('LAB:Kinuta Laboratories, Tokyo, Japan',
                    'LAB:Movielab, USA',
                    'MET:115 m',
                    'MET:12.2 m',
                    'MET:1800 m',
                    'MET:290 m',
                    'MET:30 m',
                    'MET:45.72 m',
                    'PCS:CinemaScope',
                    'PCS:Totalscope',
                    'RAT:2.20 : 1')
  AND mi2.info IN ('Biography',
                    'Drama',
                    'Film-Noir',
                    'History',
                    'Horror',
                    'Music',
                    'News',
                    'Romance',
                    'Western');