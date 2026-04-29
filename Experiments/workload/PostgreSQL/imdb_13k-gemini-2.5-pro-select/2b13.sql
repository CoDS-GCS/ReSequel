WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('105')
  AND mi1.info IN ('$10,000',
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
                    '€ 5,000')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Short')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('actress',
                   'cinematographer')
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