WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('Cantonese',
                    'English',
                    'French',
                    'Hindi',
                    'Italian',
                    'Mandarin',
                    'Portuguese')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Ultra Stereo')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('composer',
                   'production designer')
  AND k.keyword IN ('2010s',
                     'anne-shirley',
                     'barfing',
                     'black-pharoah',
                     'carver',
                     'dark-suit',
                     'eating-dog-food',
                     'gare-de-lest-paris',
                     'high-punted-football',
                     'islamic-fundamentalism',
                     'lovers-quarrel',
                     'mortgage-broker',
                     'parchment',
                     'reference-to-calliope',
                     'reference-to-chuck-berry',
                     'religion-in-politics',
                     'roanoke-virginia',
                     'stand-up');