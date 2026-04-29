WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('movie',
                   'video movie')),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('105')
     AND mi1.info IN ('$1,500',
                    '$150,000',
                    '$200',
                    '$4,000',
                    '$5,000,000',
                    '£1,000',
                    '£10,000')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('4')
     AND mi2.info IN ('English')),
     filtered_mk AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-breasts',
                     'based-on-novel',
                     'blood',
                     'character-name-in-title',
                     'cigarette-smoking',
                     'friendship',
                     'gay',
                     'homosexual',
                     'interview',
                     'mother-son-relationship',
                     'party',
                     'tv-mini-series')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('production designer')
     AND (n.gender IN ('f')
          OR n.gender IS NULL))
SELECT COUNT(*)
FROM filtered_t
JOIN filtered_mk ON filtered_t.id = filtered_mk.movie_id
JOIN filtered_mi1 ON filtered_t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON filtered_t.id = filtered_mi2.movie_id
JOIN filtered_ci ON filtered_t.id = filtered_ci.movie_id;