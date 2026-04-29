
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'video movie'))
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:2.35 : 1')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Japan',
                    'Portugal',
                    'Taiwan',
                    'UK')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('casanova',
                     'center-of-the-world',
                     'digital-video-recorder',
                     'elvis-presley-costume',
                     'french-swiss-border',
                     'holding-tongue',
                     'inkwell',
                     'man-wearing-panties',
                     'murder-of-mother-by-father',
                     'polena-ukraine',
                     'prince-of-persia',
                     'question-mark-in-title',
                     'reference-to-françois-de-la-rochefoucauld',
                     'rheumatic-fever',
                     'rob-halford',
                     'screaming-fans',
                     'sepoy',
                     'skippy-peanut-butter'));