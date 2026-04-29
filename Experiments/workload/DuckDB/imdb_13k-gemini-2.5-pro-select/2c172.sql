
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.3002)',
                   '(#1.705)',
                   '(#3.38)',
                   '(#8.4)',
                   '(1998-02-26)',
                   '(2001-06-20)',
                   '(2008-12-16)',
                   '(2012-05-03)',
                   '(500) Days of Summer',
                   'Audition Day',
                   'Close to Home',
                   'Dangerous Curves',
                   'Danish Music Awards 2003',
                   'Das Geschenk',
                   'Double Impact',
                   'Expect No Mercy',
                   'Far',
                   'High Rollers',
                   'In Another Life',
                   'Just Looking',
                   'Lets Start from the Beginning',
                   'Maximum Risk',
                   'Prelude',
                   'Reunion Show',
                   'Terrible Twos',
                   'The 54th Annual Golden Globe Awards',
                   'Touch & Go',
                   'Touch',
                   'Un altro mondo è possibile',
                   'Valley Girls',
                   'Zero Tolerance')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer',
                   'producer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('42',
                    '45',
                    '68',
                    'Canada:5',
                    'Canada:90',
                    'Germany:42',
                    'Germany:46',
                    'Japan:30',
                    'Mexico:90',
                    'USA:35',
                    'USA:52',
                    'USA:78',
                    'USA:89')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');