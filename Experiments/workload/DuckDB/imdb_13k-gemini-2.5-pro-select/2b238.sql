WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('3')
        AND info IN ('Comedy',
                    'Drama',
                    'Horror',
                    'Short')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('105')
        AND info IN ('$10,000',
                    '$15,000',
                    '$2,000',
                    '$2,500',
                    '$20,000',
                    '$300',
                    '$50,000',
                    '$500',
                    '€ 1,000')) AS mi2 ON mi1.movie_id = mi2.movie_id)
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
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('writer')
  AND n.gender IS NULL
  AND k.keyword IN ('bare-breasts',
                     'dancing',
                     'death',
                     'hardcore',
                     'homosexual',
                     'kidnapping',
                     'love',
                     'mother-daughter-relationship',
                     'nudity',
                     'one-word-title',
                     'sex',
                     'song');