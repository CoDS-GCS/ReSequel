WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.141)',
                   '(#1.326)',
                   '(#1.410)',
                   '(#1.46)',
                   '(#1.82)',
                   '(#1.890)',
                   '(#1.969)',
                   '(#2.39)',
                   '(#6.13)',
                   '(#6.20)',
                   '(#7.3)',
                   'A Night to Remember',
                   'Adam',
                   'Assassin',
                   'Avenging Angel',
                   'Caged Fury',
                   'Competition',
                   'Dallas Cowboys vs. Washington Redskins',
                   'Del 4',
                   'Downtown',
                   'Empire of Ash',
                   'Ghostbusters II',
                   'Impasse',
                   'Jigsaw',
                   'Jo Jo Dancer, Your Life Is Calling',
                   'Kidnapped',
                   'La ciociara',
                   'Lamb to the Slaughter',
                   'Lawrence of Arabia',
                   'Lethal Weapon 2',
                   'Lies',
                   'Love Me or Leave Me',
                   'Masterpiece',
                   'One on One',
                   'Quo Vadis',
                   'Roadie',
                   'Running Scared',
                   'Spring Fever',
                   'Strange Bedfellows',
                   'Sunset',
                   'Testament',
                   'The Boys',
                   'The Idol',
                   'The Red Shoes',
                   'The Source',
                   'Touch and Go',
                   'Working Girls',
                   'World Championship Wrestling')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'guest',
                   'miscellaneous crew')
  AND it1.id IN ('18')
  AND mi1.info IN ('CBS Studio 50, New York City, New York, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Lisbon, Portugal',
                    'London, England, UK',
                    'Mexico',
                    'Montréal, Québec, Canada',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Spain',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('8')
  AND mi2.info IN ('Austria',
                    'Belgium',
                    'Brazil',
                    'Canada',
                    'Finland',
                    'Japan',
                    'Netherlands',
                    'Philippines',
                    'Poland',
                    'Portugal',
                    'Sweden',
                    'UK',
                    'Yugoslavia');