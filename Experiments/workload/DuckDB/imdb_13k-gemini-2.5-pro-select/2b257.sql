
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('bathing-in-cream',
                     'burning-a-shirt',
                     'del-taco-restaurant',
                     'dragon-ball-z',
                     'hakkari-turkey',
                     'irrational-exuberance',
                     'killing-an-animal',
                     'lyster-bag',
                     'movie-theater-interior',
                     'origin-of-species',
                     'redstone-rocket',
                     'reference-to-oscar-de-la-renta',
                     'self-congratulating-coat-tails',
                     'sexual-victim',
                     'texas-flag',
                     'troop-ship',
                     'unanswered-telephone-call',
                     'warning-light',
                     'yoke')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('8')
  AND mi1.info IN ('Australia',
                    'Belgium',
                    'Canada',
                    'India',
                    'Israel',
                    'Italy',
                    'New Zealand',
                    'Philippines',
                    'Poland',
                    'South Korea',
                    'Sweden',
                    'UK',
                    'USA')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'French',
                    'Hebrew',
                    'Korean',
                    'Malayalam',
                    'Polish',
                    'Swedish',
                    'Tagalog')
  AND rt.role IN ('composer',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);