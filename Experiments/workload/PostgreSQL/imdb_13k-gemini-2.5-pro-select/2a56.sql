 
 WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE it1.id IN ('18')
  AND it2.id IN ('7')
  AND mi1.info IN ('ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Paris, France',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Rome, Lazio, Italy',
                    'Stage 17, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Studio 33, CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA')
  AND mi2.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1')
  AND rt.role IN ('cinematographer',
                   'director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);