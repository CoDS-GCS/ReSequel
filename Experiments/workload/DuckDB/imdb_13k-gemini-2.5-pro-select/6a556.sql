WITH filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actress',
                   'director')))
SELECT COUNT(*)
FROM filtered_ci
JOIN title t ON t.id = filtered_ci.movie_id
JOIN name n ON n.id = filtered_ci.person_id
JOIN movie_info mi1 ON mi1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii1 ON mii1.movie_id = filtered_ci.movie_id
JOIN movie_info_idx mii2 ON mii2.movie_id = filtered_ci.movie_id
JOIN person_info pi1 ON pi1.person_id = filtered_ci.person_id
JOIN aka_name an ON an.person_id = filtered_ci.person_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5246',
                           'A5264',
                           'C4352',
                           'E4516',
                           'F6526',
                           'H4523',
                           'H4563',
                           'J5241',
                           'J5263',
                           'K6232',
                           'M6264',
                           'N2432',
                           'S2542',
                           'V4535')
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:16 mm',
                    'PCS:Super 35',
                    'PFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1 / (high definition)')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 1000.0 AND 10000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 8.0
  AND pi1.info_type_id IN ('32');