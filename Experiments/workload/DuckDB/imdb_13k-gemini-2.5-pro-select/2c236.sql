WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.549)',
                   '(#1.5652)',
                   '(#26.9)',
                   '(1998-12-10)',
                   '(1999-09-23)',
                   '(2006-02-15)',
                   '(2009-03-08)',
                   'At Sea',
                   'Children of God',
                   'Coulda, Woulda, Shoulda',
                   'Goliath',
                   'La noche del fuego',
                   'Leading Ladies',
                   'Murder in the First',
                   'Rape',
                   'The Sisterhood of the Traveling Pants 2',
                   'The Wicked')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('costume designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('4')
  AND mi1.info IN ('70 mm 6-Track',
                    'DTS',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby SR',
                    'Dolby',
                    'Stereo',
                    'Ultra Stereo')
  AND mi2.info IN ('Arabic',
                    'Danish',
                    'Dutch',
                    'English',
                    'French',
                    'Hindi',
                    'Hungarian',
                    'Polish');