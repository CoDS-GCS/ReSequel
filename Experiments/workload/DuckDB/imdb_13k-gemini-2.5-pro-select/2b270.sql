WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('2')
        AND info IN ('Black and White',
                    'Color')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('1')
        AND info IN ('10',
                    '104',
                    '15',
                    '17',
                    '19',
                    '55',
                    '58',
                    '75',
                    '85',
                    '87',
                    '90',
                    '99',
                    'USA:11',
                    'USA:12',
                    'USA:13')) AS mi2 ON mi1.movie_id = mi2.movie_id)
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
  AND kt.kind IN ('movie',
                   'video movie')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IS NULL
  AND k.keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'based-on-play',
                     'dancing',
                     'death',
                     'hardcore',
                     'homosexual',
                     'hospital',
                     'independent-film',
                     'lesbian',
                     'love',
                     'mother-daughter-relationship',
                     'murder',
                     'new-york-city',
                     'nudity',
                     'number-in-title',
                     'one-word-title',
                     'police',
                     'revenge',
                     'singer',
                     'singing');