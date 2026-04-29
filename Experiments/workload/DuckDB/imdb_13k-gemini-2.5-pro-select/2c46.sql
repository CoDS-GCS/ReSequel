WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#3.17)',
                   '(#5.27)',
                   '(#7.14)',
                   'Bad Medicine',
                   'Blind Spot',
                   'Broadway',
                   'Conspiracy',
                   'Forbidden',
                   'La gran familia',
                   'Leuchtfeuer',
                   'Marie Antoinette',
                   'Pursued',
                   'Sans famille',
                   'Shoot to Kill',
                   'The Legacy',
                   'The Promise',
                   'The Star',
                   'Wing and a Prayer')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('LAB:DeLuxe',
                    'LAB:Kinuta Laboratories, Tokyo, Japan',
                    'MET:300 m',
                    'PCS:Spherical',
                    'RAT:1.66 : 1')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Stereo');