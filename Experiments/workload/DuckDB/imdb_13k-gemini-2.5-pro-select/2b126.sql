WITH mi_comb AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it1.id IN ('4')
     AND it2.id IN ('8')
     AND mi1.info IN ('English',
                    'Georgian',
                    'Italian',
                    'Kannada',
                    'Malay',
                    'Spanish')
     AND mi2.info IN ('Austria',
                    'Czech Republic',
                    'Germany',
                    'Hungary',
                    'India',
                    'Malaysia',
                    'Philippines',
                    'Singapore',
                    'Soviet Union',
                    'Spain',
                    'Venezuela',
                    'West Germany'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mi_comb ON t.id = mi_comb.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND k.keyword IN ('bare-chested-male',
                     'based-on-novel',
                     'dancing',
                     'doctor',
                     'family-relationships',
                     'female-frontal-nudity',
                     'friendship',
                     'gay',
                     'independent-film',
                     'interview',
                     'lesbian-sex',
                     'male-nudity',
                     'new-york-city',
                     'non-fiction',
                     'one-word-title',
                     'party',
                     'revenge',
                     'singing',
                     'surrealism')
  AND rt.role IN ('actor',
                   'director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);