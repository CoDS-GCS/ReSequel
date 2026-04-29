WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('105')
     AND mi.info IN ('$10,000',
                    '$100,000',
                    '$15,000',
                    '$2,500',
                    '$20,000',
                    '$30,000',
                    '$300',
                    '$50,000',
                    '$6,000',
                    '£1,000',
                    '€ 1,000',
                    '€ 5,000')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('3')
     AND mi.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Short'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('actress',
                   'cinematographer')
  AND n.gender IN ('f',
                    'm')
  AND k.keyword IN ('based-on-play',
                     'character-name-in-title',
                     'cigarette-smoking',
                     'death',
                     'doctor',
                     'fight',
                     'gun',
                     'hardcore',
                     'love',
                     'male-nudity',
                     'new-york-city',
                     'non-fiction',
                     'number-in-title',
                     'oral-sex',
                     'police',
                     'sex',
                     'song',
                     'surrealism',
                     'tv-mini-series',
                     'violence');