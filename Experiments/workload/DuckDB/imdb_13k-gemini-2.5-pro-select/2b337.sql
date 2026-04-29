WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('movie',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('6')
  AND mi1.info IN ('Mono',
                    'SDDS',
                    'Stereo')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('CBS Studio 50, New York City, New York, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Rome, Lazio, Italy',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Vancouver, British Columbia, Canada')
  AND n.gender IN ('f')
  AND rt.role IN ('writer')
  AND k.keyword IN ('bare-breasts',
                     'female-frontal-nudity',
                     'fight',
                     'mother-daughter-relationship');