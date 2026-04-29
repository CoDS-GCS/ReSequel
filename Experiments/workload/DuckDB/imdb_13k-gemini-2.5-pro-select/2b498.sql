WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('animal-death',
                     'apprentice-locksmith',
                     'brazil-soccer',
                     'burned-photograph',
                     'con-man',
                     'crash-avoidance',
                     'jammed-photocopier',
                     'lumbering',
                     'national-rifle-association',
                     'outlaw-band',
                     'pile-up',
                     'rain-of-arrows',
                     'reference-to-tom-bosley',
                     'sabre-held-to-throat'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('Buenos Aires, Federal District, Argentina',
                    'Los Angeles, California, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Vancouver, British Columbia, Canada')
  AND it2.id IN ('6')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'SDDS',
                    'Stereo')
  AND rt.role IN ('costume designer',
                   'editor')
  AND n.gender IN ('f',
                    'm');