WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.339)',
                   '(#1.5595)',
                   '(#1.5636)',
                   '(#1.782)',
                   '(#14.22)',
                   '(2003-04-11)',
                   '2009 MTV Movie Awards',
                   'A Commercial with Taste',
                   'Creepshow III',
                   'De prijs',
                   'Hair Show',
                   'Herzlichen Glückwunsch',
                   'Justin & Tyler',
                   'Marisol',
                   'Mit dem Rücken zur Wand',
                   'Outrageous Outlaws',
                   'Rabbids Go Home',
                   'Runaway Bride',
                   'Summer Love',
                   'The Emperors New Groove',
                   'The Final Payoff',
                   'The Reporter',
                   'User Friendly',
                   'War Stories',
                   'Weekend')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Belgium',
                    'China',
                    'Czech Republic',
                    'Estonia',
                    'Finland',
                    'Iceland',
                    'Malaysia',
                    'Netherlands',
                    'New Zealand',
                    'Philippines',
                    'Portugal',
                    'South Africa',
                    'Thailand',
                    'Venezuela');