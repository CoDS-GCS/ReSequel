WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%gord%'
     AND pi.info_type_id IN ('34')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('2',
                  '3',
                  '5')
  AND mi1.info IN ('Belgium:KT',
                    'Canada:A',
                    'Canada:AA',
                    'Denmark:11',
                    'Denmark:15',
                    'Finland:K-18',
                    'France:-12',
                    'Hong Kong:IIA',
                    'Hungary:16',
                    'Iceland:14',
                    'Ireland:18',
                    'Ireland:PG',
                    'Malaysia:18SG',
                    'Mexico:B',
                    'Norway:16',
                    'Philippines:R-13',
                    'Portugal:M/18',
                    'Singapore:PG13',
                    'Sweden:7',
                    'West Germany:18')
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
GROUP BY mi1.info,
         fp.name;