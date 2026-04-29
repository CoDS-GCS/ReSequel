
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Cologne, North Rhine - Westphalia, Germany',
                    'Hawaii, USA',
                    'Japan',
                    'Malibu, California, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'blood',
                     'dancing',
                     'dog',
                     'father-son-relationship',
                     'fight',
                     'flashback',
                     'gay',
                     'hardcore',
                     'independent-film',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'non-fiction',
                     'nudity',
                     'number-in-title',
                     'one-word-title',
                     'sex',
                     'suicide',
                     'surrealism',
                     'tv-mini-series'));