WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('3')
        AND info IN ('Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Horror',
                    'Short',
                    'Thriller')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('18')
        AND info IN ('Berlin, Germany',
                    'Buenos Aires, Federal District, Argentina',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paris, France',
                    'Toronto, Ontario, Canada')) AS mi2 ON mi1.movie_id = mi2.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_filtered ON t.id = mi_filtered.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('cinematographer')
  AND n.gender IS NULL
  AND k.keyword IN ('anal-sex',
                     'based-on-play',
                     'character-name-in-title',
                     'homosexual',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'murder');