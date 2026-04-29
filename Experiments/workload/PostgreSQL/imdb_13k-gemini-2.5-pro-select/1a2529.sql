 
 
SELECT COUNT(*)
FROM
  (SELECT id,
          kind_id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990) AS t
JOIN
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'video game',
                   'video movie')) AS kt ON t.kind_id = kt.id
JOIN
  (SELECT movie_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   JOIN name n ON ci.person_id = n.id
   WHERE rt.role IN ('actress',
                   'guest',
                   'producer',
                   'writer')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)) AS ci ON t.id = ci.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info mi
   JOIN info_type it ON mi.info_type_id = it.id
   WHERE it.id IN ('6')
     AND mi.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo',
                    'Ultra Stereo')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info mi
   JOIN info_type it ON mi.info_type_id = it.id
   WHERE it.id IN ('3')
     AND mi.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Biography',
                    'Documentary',
                    'Horror',
                    'Sci-Fi',
                    'Sport',
                    'Thriller',
                    'Western')) AS mi2 ON t.id = mi2.movie_id;