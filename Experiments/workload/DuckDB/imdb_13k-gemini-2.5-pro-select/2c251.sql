
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.title IN ('(#1.261)',
                   '(#1.450)',
                   '(#17.42)',
                   '(2000-02-08)',
                   '(2001-10-26)',
                   '(2002-01-22)',
                   '(2004-08-12)',
                   '(2004-09-04)',
                   '(2007-02-02)',
                   '(2009-05-19)',
                   '(2009-09-20)',
                   '(2009-12-05)',
                   '(2011-09-06)',
                   'Animal Control',
                   'BCN aixeca el teló',
                   'Bad Boy',
                   'Bon voyage',
                   'Capitulo 62',
                   'Chiquititas Brasil',
                   'Dark Waters',
                   'Fair Trade',
                   'Nanny McPhee',
                   'Os',
                   'The Clearing',
                   'The First Fagin',
                   'The Little Things',
                   'The Perfect Family',
                   'The Preachers Wife',
                   'The Turning Point',
                   'Trapped on a Ledge',
                   'Trigger',
                   'Weapons of Mass Distraction',
                   'Whats Eating Gilbert Grape')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'guest'))
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$1,000',
                    '$15,000',
                    '$20,000',
                    '$30,000',
                    '$5,000');