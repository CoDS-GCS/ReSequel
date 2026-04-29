
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.title IN ('(#1.6520)',
                   '(#18.168)',
                   '(#2.92)',
                   '(#3.45)',
                   '(2008-08-23)',
                   'Billy Bathgate',
                   'Chapter Ten',
                   'Dinner for One',
                   'Down on the Farm',
                   'Earth',
                   'Enron: The Smartest Guys in the Room',
                   'Funky Monkey',
                   'Guys and Dolls',
                   'I Am Divine',
                   'Its Never Too Late',
                   'Jennifer',
                   'Offshore',
                   'Out of Step',
                   'Pigalle',
                   'Sexy',
                   'Silent Treatment',
                   'Storm Warning',
                   'Swoon',
                   'Syrup',
                   'The Glass House',
                   'The Scripture of Nature: 1851-1890',
                   'The War Within',
                   'Under Cover')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'editor')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('105')
  AND it2.id IN ('2')
  AND mi1.info IN ('$1,000,000',
                    '$2,000',
                    '$25,000',
                    '$3,500',
                    '$300',
                    '$500',
                    '$75,000',
                    'CAD 10,000',
                    '£10,000',
                    '€ 100,000',
                    '€ 20,000',
                    '€ 30,000')
  AND mi2.info IN ('Black and White',
                    'Color');