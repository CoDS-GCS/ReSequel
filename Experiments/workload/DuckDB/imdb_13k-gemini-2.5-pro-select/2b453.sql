WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('8')
        AND info IN ('Argentina',
                    'Germany',
                    'UK',
                    'USA')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('1')
        AND info IN ('45',
                    '5',
                    'Argentina:60',
                    'Germany:90',
                    'USA:6')) AS mi2 ON mi1.movie_id = mi2.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_filtered ON t.id = mi_filtered.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND rt.role IN ('editor')
  AND n.gender IS NULL
  AND k.keyword IN ('anal-sex',
                     'death',
                     'independent-film',
                     'kidnapping',
                     'lesbian',
                     'male-nudity',
                     'murder',
                     'non-fiction',
                     'oral-sex',
                     'party',
                     'singer',
                     'singing',
                     'song',
                     'violence');