WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.160)',
                   '(#1.330)',
                   '(#1.338)',
                   '(#1.415)',
                   '(#1.484)',
                   '(#1.540)',
                   '(#1.612)',
                   'A Bridge Too Far',
                   'All the Kings Horses',
                   'Birdy',
                   'C.O.D.',
                   'Del 2',
                   'Dreams',
                   'Fair City',
                   'For Better, for Worse',
                   'Frances',
                   'History of the World: Part I',
                   'Hunt the Man Down',
                   'Inside Moves',
                   'Knockout',
                   'Mightier Than the Sword',
                   'Once Bitten',
                   'Predator 2',
                   'See No Evil',
                   'Shadow Play',
                   'Side by Side',
                   'The Egiht-Tomb Village',
                   'The Hidden',
                   'The Long Way Home',
                   'The Silent Partner',
                   'The Trojan Horse',
                   'The Winters Tale')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'editor',
                   'guest',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby Stereo',
                    'Dolby',
                    'Mono',
                    'Ultra Stereo')
  AND mi2.info IN ('Finland:K-8',
                    'Iceland:12',
                    'Portugal:M/18',
                    'USA:Approved',
                    'USA:G',
                    'USA:R');