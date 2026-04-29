
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND t.title IN ('(#3.24)',
                   '(#3.39)',
                   'April Fool',
                   'Arrival',
                   'As the World Turns',
                   'Ave Maria',
                   'Betrayed',
                   'Contraband',
                   'Excuse My Dust',
                   'Festival',
                   'Goin to Town',
                   'Lets Dance',
                   'Marie Antoinette',
                   'Meet the People',
                   'Monkey Business',
                   'My Favorite Spy',
                   'Ordeal',
                   'Outcast',
                   'Random Harvest',
                   'Robin Hood',
                   'San Francisco',
                   'Secrets',
                   'Stranded',
                   'The Baby Sitter',
                   'The Best Years of Our Lives',
                   'The Big Show',
                   'The Engagement',
                   'The Morning After',
                   'The Other Man',
                   'The Prisoner of Zenda',
                   'The Proposal',
                   'The Rainmaker',
                   'The Road Back',
                   'The Star',
                   'Zaza')
  AND mi1.info_type_id IN ('17')
  AND mi1.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original French title is undetermined.')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('English',
                    'French',
                    'German',
                    'Italian',
                    'Japanese',
                    'Latin',
                    'Spanish')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'costume designer',
                   'producer',
                   'writer'));