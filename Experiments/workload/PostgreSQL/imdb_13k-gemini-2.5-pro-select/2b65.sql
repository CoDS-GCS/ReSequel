
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('butchering-a-reindeer',
                     'definition',
                     'diprivan',
                     'duck-blind',
                     'magisterium',
                     'norton',
                     'porn-video',
                     'reference-to-robert-stack',
                     'reference-to-the-charge-of-the-light-brigade',
                     'sitting',
                     'weapon-inspector',
                     'woman-with-glasses')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('8')
  AND mi1.info IN ('Brazil',
                    'France',
                    'Italy',
                    'Japan',
                    'Mexico',
                    'USA',
                    'West Germany')
  AND it2.id IN ('3')
  AND mi2.info IN ('Animation',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Music',
                    'Short')
  AND rt.role IN ('costume designer',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);