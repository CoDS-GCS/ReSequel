WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%ha%'
     AND pi.info_type_id IN ('29')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('5',
                  '6',
                  '8')
  AND mi1.info IN ('6-Track Stereo',
                    'Argentina:X',
                    'Austria:16',
                    'Azerbaijan',
                    'Bahamas',
                    'Colombia:18',
                    'DTS 70 mm',
                    'Denmark:12',
                    'Dolby Stereo',
                    'Finland:K-6/4',
                    'Ireland:(Banned)',
                    'New Zealand:(Banned)',
                    'Peru',
                    'Poland:16',
                    'Romania:I.M.-18',
                    'Singapore:(Banned)',
                    'Spain:16',
                    'Switzerland:18',
                    'West Germany:0',
                    'West Germany:o.Al.')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'writer')
GROUP BY mi1.info,
         fp.name;