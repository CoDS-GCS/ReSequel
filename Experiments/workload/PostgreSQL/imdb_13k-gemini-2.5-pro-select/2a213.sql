 
 WITH t_filtered AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')),
     mi1_counts AS
  (SELECT mi1.movie_id,
          COUNT(*) AS ct
   FROM movie_info AS mi1
   WHERE mi1.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
     AND mi1.info_type_id IN ('7')
     AND mi1.info IN ('OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Techniscope',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:4:3')
   GROUP BY mi1.movie_id),
     mi2_counts AS
  (SELECT mi2.movie_id,
          COUNT(*) AS ct
   FROM movie_info AS mi2
   WHERE mi2.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
     AND mi2.info_type_id IN ('8')
     AND mi2.info IN ('Australia',
                    'Canada',
                    'Czechoslovakia',
                    'Denmark',
                    'France',
                    'Italy',
                    'Netherlands',
                    'Portugal',
                    'Soviet Union',
                    'USA')
   GROUP BY mi2.movie_id),
     ci_counts AS
  (SELECT ci.movie_id,
          COUNT(*) AS ct
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
     AND rt.role IN ('actress',
                   'cinematographer')
   GROUP BY ci.movie_id),
     mk_counts AS
  (SELECT mk.movie_id,
          COUNT(*) AS ct
   FROM movie_keyword AS mk
   WHERE mk.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
   GROUP BY mk.movie_id)
SELECT SUM(mi1.ct * mi2.ct * ci.ct * mk.ct)
FROM mi1_counts AS mi1
JOIN mi2_counts AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN ci_counts AS ci ON mi1.movie_id = ci.movie_id
JOIN mk_counts AS mk ON mi1.movie_id = mk.movie_id;