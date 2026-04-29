
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1990
  AND t.title IN ('(#3.110)',
                   '(#4.146)',
                   '(1997-11-12)',
                   '(2005-03-19)',
                   '(2007-10-06)',
                   '(2008-07-30)',
                   '(2009-03-18)',
                   'A Very Harold & Kumar 3D Christmas',
                   'Beach',
                   'Best Week Ever',
                   'Broadcast Blues',
                   'Capital Punishment',
                   'Crime damour',
                   'Daddy Day Care',
                   'Emulsion',
                   'Jackass: The Movie',
                   'Neues Leben',
                   'No Turning Back',
                   'Perfect',
                   'Santa Baby',
                   'Segundas oportunidades',
                   'Spy Kids 2: Island of Lost Dreams',
                   'Terminus',
                   'The Prodigal Son',
                   'Thief',
                   'Vice',
                   'Young Adult')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:13',
                    'Canada:18+',
                    'France:-12',
                    'Iceland:12',
                    'Iceland:L',
                    'Japan:G',
                    'Philippines:R-13',
                    'Singapore:R21',
                    'UK:12')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv series',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'costume designer',
                   'guest',
                   'miscellaneous crew'));