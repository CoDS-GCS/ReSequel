WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('6')
     AND mi1.info IN ('Mono')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('18')
     AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')),
     filtered_mk AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'bare-breasts',
                     'based-on-play',
                     'death',
                     'father-daughter-relationship',
                     'female-frontal-nudity',
                     'fight',
                     'flashback',
                     'friendship',
                     'homosexual',
                     'love',
                     'murder',
                     'non-fiction',
                     'number-in-title',
                     'singing',
                     'tv-mini-series')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('production designer')
     AND (n.gender IN ('m')
          OR n.gender IS NULL))
SELECT COUNT(*)
FROM filtered_t
JOIN filtered_mk ON filtered_t.id = filtered_mk.movie_id
JOIN filtered_mi1 ON filtered_t.id = filtered_mi1.movie_id
JOIN filtered_mi2 ON filtered_t.id = filtered_mi2.movie_id
JOIN filtered_ci ON filtered_t.id = filtered_ci.movie_id;