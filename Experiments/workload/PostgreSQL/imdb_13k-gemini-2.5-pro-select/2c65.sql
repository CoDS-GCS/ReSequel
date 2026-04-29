
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'video game',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('5')
AND mi1.info IN ('Argentina:13',
                    'Finland:K-3',
                    'Finland:K-7',
                    'France:-16',
                    'Hong Kong:III',
                    'Hungary:16',
                    'Mexico:B',
                    'Netherlands:12',
                    'New Zealand:R16',
                    'Singapore:M18',
                    'Singapore:R(A)',
                    'Sweden:15',
                    'UK:15',
                    'USA:TV-14',
                    'USA:TV-PG')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('6')
AND mi2.info IN ('70 mm 6-Track',
                    'DTS-ES',
                    'DTS-Stereo',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('writer')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('f')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.title IN ('(#1.3684)',
                   '(#1.520)',
                   '(#1.5624)',
                   '(#1.99)',
                   '(#16.57)',
                   '(#3.130)',
                   '(#6.14)',
                   '(#6.191)',
                   '(#9.23)',
                   '(1999-07-14)',
                   '(1999-08-12)',
                   '(2003-08-11)',
                   '(2004-03-23)',
                   '(2005-09-13)',
                   '(2005-12-16)',
                   '(2011-01-29)',
                   '(2011-03-12)',
                   '1994',
                   'A Dick and a Dream or Fight the Honey',
                   'Alleged',
                   'Alta Definição',
                   'Any Given Sunday',
                   'Apocalypto',
                   'Basquiat',
                   'Boys',
                   'Casting',
                   'East Broadway',
                   'Extraordinary Measures',
                   'Final Round',
                   'Finale: Part I',
                   'Fire, Plague, War and Treason',
                   'Howard Stern',
                   'Into the Light',
                   'Life Lessons',
                   'Mission to Mars',
                   'Mr. Nice',
                   'Night Vision',
                   'Paco, Slater, Biggel and Divine Accomplish Their Tasks in Marinduque',
                   'Pendulum',
                   'Salon Deco: Atlanta, GA',
                   'Self Defense',
                   'Solitary',
                   'Telemaratón',
                   'The Reunion',
                   'There Are Clues That Tells Gino Is a Dasho and That He Could Be Related with Jao',
                   'Torasuchii beru: Shopan no yume',
                   'Uncross the Stars',
                   'Untouchable',
                   'Verdades dolorosas',
                   'Windtalkers');