WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.10007)',
                   '(#1.3584)',
                   '(#1.4906)',
                   '(#1.4939)',
                   '(#1.5095)',
                   '(#1.5503)',
                   '(#1.5611)',
                   '(#1.676)',
                   '(#2.137)',
                   '(#5.6)',
                   '(1999-04-08)',
                   '(2001-09-05)',
                   '(2002-12-12)',
                   '(2003-11-24)',
                   '(2007-01-16)',
                   '(2010-08-21)',
                   '(2010-09-14)',
                   '(2011-08-26)',
                   '(2012-10-14)',
                   '(2012-11-09)',
                   'Anne Hathaway/Florence and the Machine',
                   'BearCity',
                   'Blank Slate',
                   'Bob Roberts',
                   'Catch Me... Im in Love',
                   'Celebrity Sex Tape',
                   'Die Another Day',
                   'Dyesebel',
                   'El amor y otras desgracias',
                   'Hells Gate',
                   'How Will the Nominees Cope with Their Other Housemates?',
                   'MTV Video Music Awards 2002',
                   'Now You See Me, Now You Dont',
                   'Patrick',
                   'Rain of the Children',
                   'Return of the King',
                   'Saving Lincoln',
                   'Surprise, Surprise',
                   'Sylvia',
                   'Tali-Ihantala 1944',
                   'The Housemates Amuse Themselves with Different Pranks',
                   'The Look of Love',
                   'The Penalty Box',
                   'The Survivors',
                   'Vortex')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
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
   WHERE ROLE IN ('composer',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Chinese',
                    'Croatian',
                    'French',
                    'Indonesian',
                    'Persian',
                    'Spanish',
                    'Telugu',
                    'Yoruba')
  AND mi2.info IN ('Black and White',
                    'Color');