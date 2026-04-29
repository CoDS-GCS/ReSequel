
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('English',
                    'German',
                    'Spanish')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Argentina:Atp',
                    'Finland:K-12',
                    'Finland:K-16',
                    'Iceland:L',
                    'West Germany:16')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-play',
                     'character-name-in-title',
                     'cigarette-smoking',
                     'dog',
                     'female-frontal-nudity',
                     'female-nudity',
                     'flashback',
                     'interview',
                     'mother-daughter-relationship',
                     'murder',
                     'non-fiction',
                     'singer',
                     'violence'));