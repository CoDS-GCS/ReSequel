
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND t.title IN ('(#1.170)',
                   '(#1.3599)',
                   '(#1.470)',
                   '(#1.6092)',
                   '(#1.6503)',
                   '(#15.15)',
                   '(#4.162)',
                   '(#4.36)',
                   '(1999-11-05)',
                   '(2004-06-14)',
                   '(2004-07-13)',
                   '(2005-11-17)',
                   '(2006-02-06)',
                   '(2008-08-18)',
                   '(2010-04-28)',
                   '(2012-06-01)',
                   '1',
                   'And When I Die',
                   'Begin Again',
                   'Calling All Cars',
                   'Can Gino Bring the Princess Back to Yangdon?',
                   'Carbon Copy',
                   'Culture Clash',
                   'Danse Macabre',
                   'Down to Basics',
                   'Drag-On Dragoon 2: Fûin no kurenai, haitoku no kuro',
                   'ECW One Night Stand',
                   'Elektra',
                   'Fault',
                   'Gaslight',
                   'Geburtstag',
                   'Gigolo',
                   'Hug',
                   'Life or Death',
                   'News',
                   'Návrat',
                   'Perfectly Normal',
                   'Prisoner of War',
                   'Singles',
                   'Suddenly Its Magic',
                   'Teachers Pet',
                   'Teiruzu obu Vesuperia',
                   'The New Americans',
                   'The Peoples Choice',
                   'The Tree House',
                   'The Unnatural',
                   'Tödliche Gier',
                   'Una oportunidad',
                   'Wendy Considers Forced Eviction',
                   'With or Without You')
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Australia:M',
                    'Denmark:15',
                    'France:U',
                    'France:Unrated',
                    'Hong Kong:III',
                    'Ireland:15A',
                    'Japan:R-15',
                    'Mexico:B',
                    'Philippines:PG-13',
                    'Singapore:G',
                    'UK:12',
                    'UK:15',
                    'West Germany:18')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'tv movie',
                   'video game'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'editor',
                   'guest',
                   'producer',
                   'writer'));