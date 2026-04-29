WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1975
     AND t.production_year <= 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('7')
     AND info IN ('CAM:Red One Camera',
                    'LAB:DeLuxe',
                    'OFM:Video',
                    'PCS:Digital Intermediate',
                    'PCS:Panavision',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('3')
     AND info IN ('Adventure',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Fantasy',
                    'Horror',
                    'Music',
                    'Romance',
                    'Western')),
     mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('breaking-finger',
                     'criminal',
                     'eten-island',
                     'hersheys',
                     'legation',
                     'love-seeking',
                     'name-carved-into-someones-face',
                     'pascagoula-river',
                     'university-of-pittsburgh',
                     'zippo-lighter')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('costume designer'))
SELECT COUNT(*)
FROM t_filtered t
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN mk_filtered mk ON t.id = mk.movie_id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id;