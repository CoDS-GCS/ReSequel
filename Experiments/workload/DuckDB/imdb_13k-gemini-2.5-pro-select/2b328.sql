WITH mi_filtered AS
  (SELECT mi1.movie_id
   FROM
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('8')
        AND info IN ('Australia',
                    'Germany',
                    'Indonesia',
                    'Japan',
                    'Norway',
                    'Russia',
                    'UK')) AS mi1
   JOIN
     (SELECT movie_id,
             info_type_id,
             info
      FROM movie_info
      WHERE info_type_id IN ('3')
        AND info IN ('Action',
                    'Adult',
                    'Animation',
                    'Drama',
                    'History',
                    'Short',
                    'Sport')) AS mi2 ON mi1.movie_id = mi2.movie_id)
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
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('producer',
                   'writer')
  AND n.gender IS NULL
  AND k.keyword IN ('aston-martin-db5',
                     'biowar',
                     'fake-ad',
                     'feeding-by-osmosis',
                     'gone-fishing-sign',
                     'hoe',
                     'horror-for-children',
                     'horse-semen',
                     'hungarian-filmmaking',
                     'la-palma-canary-islands',
                     'motel-manager',
                     'muscle-wasting-disease',
                     'petersburg-virginia',
                     'reference-to-eleanor-roosevelt',
                     'saints-day',
                     'self-confidence',
                     'singer-acting',
                     'the-punisher',
                     'unidentified-casualty',
                     'window-access-to-nearby-rooftop',
                     'woman-wearing-black-lingerie');