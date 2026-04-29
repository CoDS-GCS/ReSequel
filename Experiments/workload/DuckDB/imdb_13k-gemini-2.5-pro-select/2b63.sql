
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND k.id = mk.keyword_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND it1.id IN ('8')
  AND it2.id IN ('7')
  AND mi1.info IN ('France',
                    'Spain',
                    'USA')
  AND mi2.info IN ('PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1')
  AND kt.kind IN ('tv movie',
                   'video game')
  AND rt.role IN ('actor',
                   'editor')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1950 AND 2010
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
                     'singing');