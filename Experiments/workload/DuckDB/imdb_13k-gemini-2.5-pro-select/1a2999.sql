WITH movie_ids AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM movie_ids
JOIN cast_info AS ci ON movie_ids.id = ci.movie_id
JOIN movie_info AS mi1 ON movie_ids.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_ids.id = mi2.movie_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Indonesian',
                    'Serbo-Croatian',
                    'Slovak',
                    'Telugu',
                    'Urdu')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Atlanta, Georgia, USA',
                    'Australia',
                    'Burbank, California, USA',
                    'California, USA',
                    'Las Vegas, Nevada, USA',
                    'Miami, Florida, USA',
                    'New York, USA',
                    'Rio de Janeiro, Rio de Janeiro, Brazil',
                    'Rome, Lazio, Italy',
                    'Thailand',
                    'Toronto, Ontario, Canada');