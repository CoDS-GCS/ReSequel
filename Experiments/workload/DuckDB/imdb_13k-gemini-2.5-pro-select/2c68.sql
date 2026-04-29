WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1875
     AND t.title IN ('(#2.43)',
                   '(#5.29)',
                   '(#6.23)',
                   'A beszélö köntös',
                   'Beyond a Reasonable Doubt',
                   'Devotion',
                   'Die Erbschaft',
                   'Executive Action',
                   'Follow the Leader',
                   'Handle with Care',
                   'Happy Days',
                   'Honky Tonk',
                   'Joan of Arc',
                   'Justice',
                   'Kvartetten som sprängdes',
                   'Man in the Middle',
                   'Romeo and Juliet',
                   'Sailor Beware',
                   'Scapegoat',
                   'Six Bridges to Cross',
                   'South Pacific',
                   'The Choice',
                   'The Paleface',
                   'The Secret Life of Walter Mitty',
                   'The Show of Shows',
                   'The Talk of the Town',
                   'The Taming of the Shrew',
                   'The Tell-Tale Heart',
                   'Wedding Bells')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f',
                    'm')
     AND rt.role IN ('costume designer')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('7')
     AND mi1.info IN ('LAB:Movielab, USA',
                    'LAB:Pathé Laboratory, USA',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'MET:',
                    'PCS:Panavision',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1',
                    'RAT:4:3'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:M',
                    'Australia:MA',
                    'Finland:K-15',
                    'Finland:K-18',
                    'Iceland:16',
                    'Italy:VM14',
                    'Norway:12',
                    'UK:X',
                    'USA:Not Rated',
                    'USA:Passed',
                    'USA:R',
                    'USA:TV-G',
                    'West Germany:12');