
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1990
  AND t.title IN ('(#1.225)',
                   '(#1.3599)',
                   '(#1.4664)',
                   '(#1.6109)',
                   '(#1.824)',
                   '(#15.21)',
                   '(#4.196)',
                   '(#7.160)',
                   '(#8.139)',
                   '(1999-11-23)',
                   '(2002-11-29)',
                   '(2004-08-16)',
                   '(2006-01-05)',
                   '(2007-03-04)',
                   '(2010-09-25)',
                   '(2012-09-09)',
                   'Barnyard',
                   'Bedtime',
                   'Breaking In',
                   'Fahrenheit 9/11',
                   'Hoher Besuch',
                   'House of Cards',
                   'I Dont Think I Can Do This',
                   'Irina Palm',
                   'Mindstorm',
                   'On Trial',
                   'Patient Zero',
                   'Revenge',
                   'Scratch the Surface',
                   'Small Town',
                   'Soul of Fire',
                   'The 73rd Annual Academy Awards',
                   'The Cold War',
                   'The Graduates',
                   'The Path to 9/11',
                   'The Texas Chainsaw Massacre: The Beginning',
                   'Turnabout',
                   'Twos Company',
                   'Unha nova vida',
                   'Will Princess Areeyah Be Ripped Off Her Freedom to Decide If She Wants to Marry or Not?')
  AND mi1.info_type_id IN ('16')
  AND mi1.info IN ('USA:1996',
                    'USA:2001',
                    'USA:2002',
                    'USA:2003',
                    'USA:2005',
                    'USA:2011',
                    'USA:2014',
                    'USA:April 2008',
                    'USA:April 2010',
                    'USA:August 2012',
                    'USA:May 2011',
                    'USA:October 2007')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'composer',
                   'costume designer',
                   'director',
                   'editor'));