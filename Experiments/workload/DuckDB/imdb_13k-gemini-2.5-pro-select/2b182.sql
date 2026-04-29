WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('5')
        AND info IN ('Norway:16',
                    'Sweden:Btl',
                    'UK:A',
                    'USA:Not Rated',
                    'USA:PG')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('2')
        AND info IN ('Black and White',
                    'Color')) AS mi2 ON mi1.movie_id = mi2.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_filtered ON t.id = mi_filtered.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IS NULL
  AND k.keyword IN ('cigarette-smoking',
                     'doctor',
                     'father-son-relationship',
                     'gun',
                     'hardcore',
                     'kidnapping',
                     'party',
                     'sequel',
                     'sex',
                     'singing',
                     'suicide');