WITH mi_comb AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it1.id IN ('5')
     AND it2.id IN ('18')
     AND mi1.info IN ('Argentina:Atp',
                    'Germany:16',
                    'Iceland:L',
                    'Netherlands:12',
                    'Sweden:15',
                    'UK:15',
                    'USA:Not Rated',
                    'USA:PG-13')
     AND mi2.info IN ('Argentina',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'New York City, New York, USA'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mi_comb ON t.id = mi_comb.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'bare-chested-male',
                     'based-on-play',
                     'character-name-in-title',
                     'dog',
                     'female-frontal-nudity',
                     'female-nudity',
                     'friendship',
                     'marriage',
                     'non-fiction',
                     'number-in-title',
                     'oral-sex',
                     'party',
                     'sequel',
                     'singing',
                     'suicide',
                     'tv-mini-series')
  AND rt.role IN ('cinematographer',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);