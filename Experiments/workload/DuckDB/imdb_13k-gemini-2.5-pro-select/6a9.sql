WITH filtered_t AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('episode',
                   'movie')
     AND t.production_year BETWEEN 1975 AND 2015),
     filtered_n AS
  (SELECT n.id
   FROM name n
   WHERE n.gender IS NULL
     AND (n.name_pcode_nf IN ('A5362',
                           'A6532',
                           'C5321',
                           'C6231',
                           'C6235',
                           'R5316')
          OR n.name_pcode_nf IS NULL)),
     filtered_ci AS
  (SELECT ci.movie_id,
          ci.person_id
   FROM cast_info ci
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE rt.role IN ('composer',
                   'director',
                   'editor',
                   'producer',
                   'writer')
     AND (ci.note IN ('(deviser)',
                   '(executive producer)',
                   '(producer)',
                   '(supervising producer)')
          OR ci.note IS NULL))
SELECT COUNT(*)
FROM filtered_t t
JOIN filtered_ci ci ON t.id = ci.movie_id
JOIN filtered_n n ON n.id = ci.person_id
JOIN aka_name an ON n.id = an.person_id
JOIN person_info pi1 ON n.id = pi1.person_id
JOIN movie_info mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx mii2 ON t.id = mii2.movie_id
WHERE pi1.info_type_id IN ('22')
  AND mi1.info_type_id IN ('103',
                  '5',
                  '6')
  AND mi1.info IN ('Argentina:16',
                    'Australia:PG',
                    'France:U',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:16',
                    'South Korea:15',
                    'UK:PG',
                    'USA:PG',
                    'USA:PG-13')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 4.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0;