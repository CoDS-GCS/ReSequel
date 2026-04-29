WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bombay-india',
                     'latin-grammar',
                     'media-coverage',
                     'megaburger',
                     'severed-sheeps-head',
                     'spiel',
                     'thumb-as-cigarette-lighter',
                     'unzipping-trousers'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Digital',
                    'OFM:Video',
                    'PFM:35 mm',
                    'PFM:70 mm',
                    'RAT:1.66 : 1')
  AND it2.id IN ('8')
  AND mi2.info IN ('Australia',
                    'Brazil',
                    'Canada',
                    'Germany',
                    'Italy',
                    'Taiwan',
                    'USA')
  AND rt.role IN ('production designer')
  AND n.gender IN ('f');