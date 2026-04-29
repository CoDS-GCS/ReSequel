WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('8')
        AND info IN ('Cuba',
                    'Czech Republic',
                    'Czechoslovakia',
                    'Estonia',
                    'Hungary',
                    'Iran',
                    'New Zealand',
                    'Poland',
                    'Portugal',
                    'Soviet Union',
                    'Switzerland')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('2')
        AND info IN ('Black and White',
                    'Color')) AS mi2 ON mi1.movie_id = mi2.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_filtered ON t.id = mi_filtered.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('director',
                   'editor')
  AND n.gender IS NULL
  AND k.keyword IN ('black-issues',
                     'broken-chair',
                     'canzone',
                     'champagne-glass',
                     'comic-acronym',
                     'crash-test-dummy',
                     'fake-biography',
                     'head-mounted-display',
                     'homebase-security',
                     'jewish-lesbian',
                     'kalam',
                     'lincoln-jail-england',
                     'magus',
                     'maid',
                     'newsreel',
                     'online-combat',
                     'own-grandpa',
                     'pubescence',
                     'reading-a-bedtime-story-to-children',
                     'reference-to-george-eliot',
                     'remake-of-spanish-film',
                     'swimming-baths',
                     'top-meeting',
                     'turkish-independence-war');