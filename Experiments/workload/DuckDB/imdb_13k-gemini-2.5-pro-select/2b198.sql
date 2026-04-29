WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('1')
        AND info IN ('106',
                    '14',
                    '16',
                    '26',
                    '40',
                    '9',
                    'USA:100',
                    'USA:120',
                    'USA:22')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('3')
        AND info IN ('Documentary',
                    'Drama',
                    'Short')) AS mi2 ON mi1.movie_id = mi2.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_filtered ON t.id = mi_filtered.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('composer',
                   'miscellaneous crew')
  AND n.gender IS NULL
  AND k.keyword IN ('apache-wells-arizona',
                     'betelnut',
                     'esaala-cave',
                     'filming',
                     'gouzenko-affair',
                     'killing-girlfriend',
                     'knocking-a-hole-in-a-wall',
                     'nurse-cap',
                     'quintain',
                     'red-coral',
                     'reference-to-odysseus',
                     'san-francisco-bay-guardian-the-newspaper',
                     'supervisor',
                     'the-ss-great-western');