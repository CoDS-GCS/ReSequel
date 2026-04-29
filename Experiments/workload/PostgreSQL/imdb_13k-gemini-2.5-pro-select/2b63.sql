
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                   'video game')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
AND k.keyword IN ('bare-breasts',
                     'based-on-play',
                     'cigarette-smoking',
                     'dog',
                     'female-frontal-nudity',
                     'fight',
                     'gay',
                     'hardcore',
                     'homosexual',
                     'hospital',
                     'husband-wife-relationship',
                     'independent-film',
                     'kidnapping',
                     'lesbian-sex',
                     'mother-son-relationship',
                     'one-word-title',
                     'party',
                     'police',
                     'sex',
                     'singing')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'editor')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('m')
     OR n.gender IS NULL)
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('8')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('7')
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info IN ('France',
                    'Spain',
                    'USA')
  AND mi2.info IN ('PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1');