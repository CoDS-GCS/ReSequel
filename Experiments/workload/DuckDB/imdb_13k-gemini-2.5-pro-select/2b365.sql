WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('5')
        AND info IN ('Argentina:13',
                    'Argentina:16',
                    'Argentina:Atp',
                    'Australia:G')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('1')
        AND info IN ('30',
                    'Argentina:60')) AS mi2 ON mi1.movie_id = mi2.movie_id)
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
  AND rt.role IN ('director',
                   'writer')
  AND n.gender IS NULL
  AND k.keyword IN ('17-year-old',
                     'chicken-and-egg',
                     'climbing-on-a-piano',
                     'dumb-criminal',
                     'electronics-equipment',
                     'emery-board',
                     'factory-explosion',
                     'fictitious-animal',
                     'g-8',
                     'ill-mother',
                     'kosovo-war',
                     'puerperal-fever',
                     'reference-to-devil',
                     'reference-to-earl-schieb',
                     'reference-to-the-delaware-river',
                     'rodin-museum-paris',
                     'running-mate',
                     'tattoo-on-ones-back',
                     'teenage-hero',
                     'tenderloin-san-francisco',
                     'thrown-overboard',
                     'title-in-title',
                     'twiddling-ones-thumbs',
                     'vinland');