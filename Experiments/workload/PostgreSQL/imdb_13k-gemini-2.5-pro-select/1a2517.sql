 
 WITH cast_counts AS
  (SELECT ci.movie_id,
          count(*) AS num_casts
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('director')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
   GROUP BY ci.movie_id),
     info1_counts AS
  (SELECT mi1.movie_id,
          count(*) AS num_info1
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('4')
     AND mi1.info IN ('Czech',
                    'Finnish',
                    'French',
                    'Gujarati',
                    'Romanian',
                    'Vietnamese')
   GROUP BY mi1.movie_id),
     info2_counts AS
  (SELECT mi2.movie_id,
          count(*) AS num_info2
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('8')
     AND mi2.info IN ('Germany',
                    'Hong Kong',
                    'Hungary',
                    'Israel',
                    'Mexico',
                    'New Zealand',
                    'Romania',
                    'Russia',
                    'Sweden',
                    'USA')
   GROUP BY mi2.movie_id)
SELECT SUM(cc.num_casts * i1c.num_info1 * i2c.num_info2)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_counts AS cc ON t.id = cc.movie_id
JOIN info1_counts AS i1c ON t.id = i1c.movie_id
JOIN info2_counts AS i2c ON t.id = i2c.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series');