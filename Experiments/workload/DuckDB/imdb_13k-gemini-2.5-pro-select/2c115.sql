WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.23)',
                   '(#3.20)',
                   '(#6.23)',
                   '(#8.9)',
                   'A Star Is Born',
                   'Alibi',
                   'Anna Christie',
                   'Bad Company',
                   'Ben-Hur',
                   'Brother Can You Spare a Dime',
                   'Cavalcade',
                   'Checkmate',
                   'Court Martial',
                   'Das Lied der Matrosen',
                   'Der Feldherrnhügel',
                   'Devotion',
                   'Die Unbesiegbaren',
                   'Faces',
                   'Golden Girl',
                   'Hold Back the Dawn',
                   'Let Us Live',
                   'Line of Fire',
                   'Luther',
                   'Montserrat',
                   'Mr. District Attorney',
                   'Mr. Smith Goes to Washington',
                   'Na vseki kilometar',
                   'Neighbors',
                   'Nora',
                   'O.S.S.',
                   'One Life to Live',
                   'Quarta puntata',
                   'Reunion in France',
                   'TV or Not TV',
                   'The Court Jester',
                   'The Fugitives',
                   'The Gamble',
                   'The Inside Man',
                   'The Ladies Man',
                   'The Milkman',
                   'The Monster',
                   'The Peacemaker',
                   'The Razors Edge',
                   'Trial by Fire',
                   'Urlaub auf Ehrenwort',
                   'Volpone',
                   'With This Ring',
                   'Young Love')
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
   WHERE ROLE IN ('cinematographer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('5')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('Belgium:KT',
                    'Finland:K-18',
                    'Finland:S',
                    'Sweden:11',
                    'UK:18',
                    'USA:R',
                    'West Germany:12')
  AND mi2.info IN ('Argentina',
                    'Belgium',
                    'Canada',
                    'France',
                    'India',
                    'Italy',
                    'Spain',
                    'UK',
                    'USA',
                    'West Germany');