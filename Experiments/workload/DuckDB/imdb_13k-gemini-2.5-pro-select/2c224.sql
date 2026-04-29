
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND t.title IN ('(#1.13)',
                   '(#1.528)',
                   '(#13.55)',
                   '(1999-07-30)',
                   '(2000-03-24)',
                   '(2004-11-21)',
                   '(2010-09-13)',
                   '(2012-10-23)',
                   '...and a Dancing Santa',
                   'Andrea Chénier',
                   'Baba',
                   'Cabin Fever 2: Spring Fever',
                   'Control Factor',
                   'Everest',
                   'George',
                   'Goodbye, Mr. Chips',
                   'Its Okay, Run Them Over!',
                   'Liv',
                   'Over the Edge',
                   'Research and Destroy',
                   'Sea of Love',
                   'Temple Grandin',
                   'The Night We Never Met')
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Animation',
                    'Biography',
                    'Comedy',
                    'Drama',
                    'Family',
                    'Film-Noir',
                    'History',
                    'Horror',
                    'Music',
                    'Mystery',
                    'Sport',
                    'Talk-Show')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('British Columbia, Canada',
                    'Brooklyn, New York City, New York, USA',
                    'Metro Manila, Luzon, Philippines',
                    'Rio de Janeiro, Rio de Janeiro, Brazil',
                    'Santiago, Chile',
                    'Singapore',
                    'Toronto, Ontario, Canada',
                    'Van Nuys, Los Angeles, California, USA')
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
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'editor',
                   'producer',
                   'writer'));