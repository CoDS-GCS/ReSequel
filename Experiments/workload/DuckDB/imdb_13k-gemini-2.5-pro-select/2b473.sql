WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('8')
        AND info IN ('East Germany',
                    'Finland',
                    'Germany',
                    'Poland',
                    'Spain',
                    'USA',
                    'West Germany',
                    'Yugoslavia')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('7')
        AND info IN ('CAM:Panasonic AG-HVX200',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'OFM:35 mm',
                    'OFM:Super 16',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:16:9 HD',
                    'RAT:2.35 : 1')) AS mi2 ON mi1.movie_id = mi2.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_filtered ON t.id = mi_filtered.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('writer')
  AND n.gender IS NULL
  AND k.keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'cigarette-smoking',
                     'death',
                     'family-relationships',
                     'father-daughter-relationship',
                     'gay',
                     'hardcore',
                     'independent-film',
                     'kidnapping',
                     'love',
                     'male-nudity',
                     'non-fiction',
                     'nudity',
                     'sequel',
                     'singing',
                     'suicide',
                     'surrealism');