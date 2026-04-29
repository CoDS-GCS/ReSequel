WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.10)',
                   '(#1.211)',
                   '(#1.270)',
                   '(#1.445)',
                   '(#1.566)',
                   '(#1.638)',
                   '(#1.667)',
                   '(#1.818)',
                   '(#1.968)',
                   '(#2.59)',
                   '(#8.7)',
                   'A Matter of Honor',
                   'And Then There Were None',
                   'Assassination',
                   'Big Daddy',
                   'Blood Brothers',
                   'Buried Alive',
                   'Caged Fury',
                   'Fanny Hill',
                   'Flying Blind',
                   'Fukkatsu no hi',
                   'Happy Birthday',
                   'Mastermind',
                   'Paternity',
                   'Poker',
                   'Prisoner',
                   'Radio Days',
                   'Redemption',
                   'Salvage',
                   'Scrooged',
                   'Separation',
                   'Studs Lonigan',
                   'The Las Vegas Story',
                   'The Long Wait',
                   'The Reunion',
                   'The Snows of Kilimanjaro',
                   'The Son Also Rises',
                   'Thérèse Raquin')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'guest',
                   'miscellaneous crew')
  AND it1.id IN ('4')
  AND mi1.info IN ('Bengali',
                    'Cantonese',
                    'Czech',
                    'Danish',
                    'English',
                    'German',
                    'Hindi',
                    'Serbo-Croatian',
                    'Slovak',
                    'Spanish',
                    'Turkish')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'PCS:CinemaScope',
                    'PCS:Panavision',
                    'PFM:70 mm',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1');