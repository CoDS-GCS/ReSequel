
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND t.title IN ('(#1.2230)',
                   '(#1.5405)',
                   '(2002-10-02)',
                   '(2003-06-26)',
                   '(2005-11-21)',
                   '(2006-04-12)',
                   '(2007-11-26)',
                   '(2009-01-30)',
                   '(2010-02-13)',
                   '(2013-03-12)',
                   'Az ember tragédiája',
                   'Below',
                   'Der Neue',
                   'El cantante',
                   'Grounded',
                   'Hinter verschlossenen Türen',
                   'Is There a Doctor in the House?',
                   'La cité de la peur',
                   'Les contes dHoffmann',
                   'My Life in Ruins',
                   'Paradise Lost: Part 1',
                   'Passover',
                   'Pet Shop',
                   'Sgt. Kabukiman N.Y.P.D.',
                   'The Duke',
                   'The Grudge',
                   'The Perfect Crime',
                   'The Witnesses',
                   'Valhalla',
                   'When the Levees Broke: A Requiem in Four Acts')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS',
                    'DTS-ES',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby Stereo',
                    'Dolby',
                    'Mono',
                    'Sonics-DDP')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Finland:K-11',
                    'Hong Kong:IIB',
                    'Iceland:14',
                    'Spain:18',
                    'Sweden:15',
                    'Switzerland:12',
                    'UK:A',
                    'USA:TV-PG')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'miscellaneous crew',
                   'producer',
                   'production designer'));