
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('based-on-play',
                     'blood',
                     'cigarette-smoking',
                     'family-relationships',
                     'father-daughter-relationship',
                     'female-frontal-nudity',
                     'friendship',
                     'homosexual',
                     'husband-wife-relationship',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'murder',
                     'new-york-city',
                     'non-fiction',
                     'oral-sex',
                     'revenge',
                     'singing',
                     'suicide')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Panasonic AG-DVX100',
                    'CAM:Panavision Cameras and Lenses',
                    'LAB:DeLuxe',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PCS:Super 35',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Comedy',
                    'Drama',
                    'Music',
                    'Musical',
                    'Romance',
                    'Short',
                    'Sport',
                    'Thriller',
                    'War')
  AND rt.role IN ('composer',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);