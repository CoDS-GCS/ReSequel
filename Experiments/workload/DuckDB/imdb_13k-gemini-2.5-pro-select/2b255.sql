
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
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('Mono',
                    'Silent')
  AND it2.id IN ('8')
  AND mi2.info IN ('France',
                    'Germany',
                    'India',
                    'Italy',
                    'Japan',
                    'Soviet Union',
                    'Spain',
                    'UK',
                    'USA',
                    'West Germany',
                    'Yugoslavia')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IS NULL
  AND k.keyword IN ('bare-chested-male',
                     'blood',
                     'character-name-in-title',
                     'death',
                     'family-relationships',
                     'fight',
                     'friendship',
                     'gay',
                     'gun',
                     'hardcore',
                     'jealousy',
                     'kidnapping',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'non-fiction',
                     'one-word-title',
                     'suicide',
                     'surrealism');