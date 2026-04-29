WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.10114)',
                   '(#1.1363)',
                   '(#1.3697)',
                   '(#1.3737)',
                   '(#1.6051)',
                   '(#12.45)',
                   '(#16.75)',
                   '(#4.152)',
                   '(#8.6)',
                   '(1999-04-19)',
                   '(2001-02-24)',
                   '(2003-01-29)',
                   '(2006-06-20)',
                   '(2009-01-12)',
                   '(2012-05-21)',
                   '(2012-11-27)',
                   'All About Eve',
                   'Alles aus Liebe',
                   'Am Scheideweg',
                   'Appaloosa',
                   'Army of Darkness',
                   'Bicentennial Man',
                   'Brother from Another Series',
                   'Brüno',
                   'Cerca de la verdad',
                   'Changes',
                   'Dracula: The Musical',
                   'Film Noir',
                   'Geisterstunde',
                   'Hatred Starts to Grow in Jaos Heart',
                   'Housewarming',
                   'Jappening con Ja',
                   'Mind Games',
                   'Once Again',
                   'Osa 2',
                   'Pregnant Pause',
                   'Protection',
                   'Shes Gone',
                   'Sisterly Love',
                   'Swallow',
                   'Szabadság, szerelem',
                   'Tempting Fate',
                   'The Blackout',
                   'The Divorce',
                   'The Hard Sell',
                   'The King and I',
                   'The Mechanic',
                   'Whats Eating Gilbert Grape',
                   'Whats Your Sign?',
                   'Zombie Prom')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
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
WHERE mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Action',
                    'Adventure',
                    'Biography',
                    'Comedy',
                    'Fantasy',
                    'History',
                    'Musical',
                    'Mystery',
                    'News',
                    'War')
  AND mi2.info IN ('70 mm 6-Track',
                    'DTS',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Silent',
                    'Stereo');