
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'Bulgaria',
                    'Canada',
                    'Germany',
                    'India',
                    'Italy',
                    'Mexico',
                    'Netherlands',
                    'Sweden',
                    'UK')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('4th-century-b.c.',
                     'blindness-caused-by-boxing',
                     'bombing-victim',
                     'circus-giant',
                     'decamerotic',
                     'eaten-by-shark',
                     'exploding-dam',
                     'glass-vase',
                     'indigenous-language',
                     'ithaca-college',
                     'la-vida-loca',
                     'lancet',
                     'meekness',
                     'modern-medicine',
                     'no-soundtrack',
                     'pet-trick',
                     'pink-lips',
                     'pizza-delivery',
                     'reference-to-avalokiteshvara',
                     'reference-to-the-hope-diamond',
                     'skinny-dipping',
                     'spelling',
                     'stick-fight'));