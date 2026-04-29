WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.1)',
                   '(#1.30)',
                   '(#1.89)',
                   '(#1.96)',
                   '(#3.4)',
                   '(#4.35)',
                   '(#6.17)',
                   '(#7.3)',
                   'A Matter of Honor',
                   'A Star Is Born',
                   'A Tree Grows in Brooklyn',
                   'All My Children',
                   'Arashi o yobu otoko',
                   'Clash by Night',
                   'Daddy Long Legs',
                   'Delayed Action',
                   'Double Date',
                   'Fools Gold',
                   'Fünfter Teil',
                   'Going Home',
                   'Jane Eyre',
                   'Jeder stirbt für sich allein',
                   'Krach im Hinterhaus',
                   'Lady in the Dark',
                   'Law and Order',
                   'Les Misérables',
                   'Linda',
                   'Mirage',
                   'Music Hath Charms',
                   'Once a Thief',
                   'Pittsburgh',
                   'Quinta puntata',
                   'Rózsa Sándor',
                   'Samson and Delilah',
                   'Sarajevski atentat',
                   'Stranger in Town',
                   'Tennessee Johnson',
                   'The Bait',
                   'The Best Years of Our Lives',
                   'The Big Noise',
                   'The Big Show',
                   'The Eurovision Song Contest',
                   'The Hospital',
                   'The Jackpot',
                   'The Last Frontier',
                   'The Snows of Kilimanjaro',
                   'The Thanksgiving Story',
                   'Unser Sandmännchen')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
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
                   'cinematographer',
                   'costume designer',
                   'editor',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('East Germany',
                    'France',
                    'Greece',
                    'Japan',
                    'Mexico',
                    'Portugal',
                    'Romania',
                    'Sweden',
                    'Switzerland',
                    'USA',
                    'Yugoslavia')
  AND mi2.info IN ('LAB:Technicolor, USA',
                    'MET:300 m',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Kinescope',
                    'PCS:Spherical',
                    'PFM:70 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1');