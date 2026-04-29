WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('8')
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
  AND n.gender IN ('f')
  AND rt.role IN ('miscellaneous crew')
  AND k.keyword IN ('4th-century-b.c.',
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
                     'stick-fight');