WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#16.60)',
                   '(#4.22)',
                   '(1992-05-22)',
                   '(2000-06-08)',
                   '(2008-10-25)',
                   '(2011-05-24)',
                   '(2011-11-16)',
                   '(2012-09-14)',
                   'Americas Cutest Dog',
                   'Andrew',
                   'Community Spirit',
                   'Das Findelkind',
                   'Die Eisprinzessin',
                   'Dream Girl',
                   'Floricienta',
                   'Four Corners',
                   'Four Sons',
                   'G.I. Joe: The Movie',
                   'Henry IV',
                   'House of Frankenstein',
                   'Michelle',
                   'Mikay Comes Closer to Yangdon',
                   'Misery Loves Company',
                   'Moving In',
                   'Offender',
                   'Out in the Open',
                   'Panacea',
                   'Pete Smalls Is Dead',
                   'Poudre aux yeux',
                   'Small Change',
                   'Sound of Noise',
                   'Tabu',
                   'The Big Apple',
                   'The Expert',
                   'The Good Guy',
                   'The Muppet Movie',
                   'Tubby Lunchbox',
                   'Week Four')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Filmistan Studios, Mumbai, Maharashtra, India',
                    'Hong Kong, China',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'London, England, UK',
                    'Melbourne, Victoria, Australia',
                    'Stage 6, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'USA',
                    'Vancouver, British Columbia, Canada',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND mi2.info IN ('Black and White',
                    'Color');