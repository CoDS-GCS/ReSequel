WITH filtered_t AS MATERIALIZED
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'video movie'))),
     filtered_mk AS MATERIALIZED
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   WHERE mk.keyword_id IN
       (SELECT id
        FROM keyword
        WHERE keyword IN ('bare-breasts',
                     'based-on-novel',
                     'based-on-play',
                     'cigarette-smoking',
                     'dancing',
                     'father-daughter-relationship',
                     'friendship',
                     'independent-film',
                     'interview',
                     'kidnapping',
                     'lesbian-sex',
                     'male-nudity',
                     'non-fiction',
                     'number-in-title',
                     'one-word-title',
                     'party',
                     'revenge',
                     'singer',
                     'surrealism',
                     'tv-mini-series'))),
     filtered_mi1 AS MATERIALIZED
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('7')
     AND mi1.info IN ('CAM:Arriflex Cameras',
                    'CAM:Red One Camera',
                    'OFM:35 mm',
                    'OFM:Video',
                    'PCS:Digital Intermediate',
                    'PCS:Spherical',
                    'RAT:1.37 : 1',
                    'RAT:2.35 : 1')),
     filtered_mi2 AS MATERIALIZED
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('2')
     AND mi2.info IN ('Color')),
     filtered_ci AS MATERIALIZED
  (SELECT ci.movie_id
   FROM cast_info AS ci
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('writer'))
     AND ci.person_id IN
       (SELECT id
        FROM name
        WHERE gender IN ('m')
          OR gender IS NULL))
SELECT COUNT(*)
FROM filtered_t
JOIN filtered_mk ON filtered_t.id = filtered_mk.movie_id
JOIN filtered_mi1 ON filtered_t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON filtered_t.id = filtered_mi2.movie_id
JOIN filtered_ci ON filtered_t.id = filtered_ci.movie_id;