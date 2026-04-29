WITH ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('actress')
     AND n.gender IN ('m'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Stereo')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Belgium',
                    'Canada',
                    'France',
                    'Japan',
                    'Spain',
                    'UK',
                    'USA')
  AND k.keyword IN ('death',
                     'father-daughter-relationship',
                     'hardcore',
                     'husband-wife-relationship',
                     'independent-film',
                     'jealousy',
                     'love',
                     'nudity',
                     'police',
                     'revenge',
                     'violence');