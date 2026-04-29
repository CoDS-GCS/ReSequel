 
 WITH mi1_counts AS
  (SELECT mi1.movie_id,
          COUNT(*) AS ct
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('7')
     AND mi1.info IN ('OFM:35 mm',
                    'PCS:DV',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')
   GROUP BY mi1.movie_id),
     mi2_counts AS
  (SELECT mi2.movie_id,
          COUNT(*) AS ct
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('8')
     AND mi2.info IN ('Canada',
                    'France',
                    'Germany',
                    'UK',
                    'USA')
   GROUP BY mi2.movie_id),
     ci_counts AS
  (SELECT ci.movie_id,
          COUNT(*) AS ct
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE (n.gender IN ('m')
          OR n.gender IS NULL)
     AND rt.role IN ('costume designer')
   GROUP BY ci.movie_id),
     mk_counts AS
  (SELECT mk.movie_id,
          COUNT(*) AS ct
   FROM movie_keyword AS mk
   GROUP BY mk.movie_id)
SELECT SUM(mi1.ct * mi2.ct * ci.ct * mk.ct)
FROM title t
JOIN kind_type kt ON t.kind_id = kt.id
JOIN mi1_counts mi1 ON t.id = mi1.movie_id
JOIN mi2_counts mi2 ON t.id = mi2.movie_id
JOIN ci_counts ci ON t.id = ci.movie_id
JOIN mk_counts mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie');