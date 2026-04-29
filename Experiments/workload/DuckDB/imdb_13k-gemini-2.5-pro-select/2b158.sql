WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('6')
        AND info IN ('Dolby Digital',
                    'Mono',
                    'Stereo')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('8')
        AND info IN ('Argentina',
                    'Australia',
                    'Canada',
                    'France',
                    'Hong Kong',
                    'Japan',
                    'UK',
                    'Yugoslavia')) AS mi2 ON mi1.movie_id = mi2.movie_id)
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
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('cinematographer')
  AND n.gender IS NULL
  AND k.keyword IN ('backyard-epic-spoof',
                     'burning-film-in-the-end',
                     'deaf-party',
                     'fox-hunt',
                     'gleiwitz-germany',
                     'green-bra',
                     'helium-voice',
                     'hiker',
                     'life-passing-by',
                     'military-headquarters',
                     'naked-girl',
                     'pioneer-women',
                     'pushing-the-envelope',
                     'redwood',
                     'reference-to-1776-the-stage-musical',
                     'reference-to-alice-in-wonderland-the-stage-play',
                     'reference-to-anna-deavere-smith',
                     'sex-with-robot',
                     'washing-mirror',
                     'wobbly');