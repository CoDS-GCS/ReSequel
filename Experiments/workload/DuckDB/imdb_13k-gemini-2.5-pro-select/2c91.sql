WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(1998-01-12)',
                   '(2010-11-27)',
                   'Ashi Behati Introduces Jao as Her Son and as the Prince of Yangdon',
                   'Auf schmalem Grat',
                   'Fallen Angels',
                   'Get Rich or Die Tryin',
                   'Off and Running',
                   'The Fortune Cookie',
                   'The People Speak',
                   'The Wizened Woods')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'guest',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Australia',
                    'Burbank, California, USA',
                    'Germany',
                    'Helsinki, Finland',
                    'Madrid, Spain',
                    'Miami, Florida, USA',
                    'New Jersey, USA',
                    'San Diego, California, USA',
                    'Santa Monica, California, USA',
                    'South Africa',
                    'Stockholm, Stockholms län, Sweden',
                    'USA');