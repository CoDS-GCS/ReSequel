
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A5353',
                           'B6534',
                           'C625',
                           'D1315',
                           'D5452',
                           'E6216',
                           'E6253',
                           'J5416',
                           'M2454',
                           'M6241',
                           'P3625',
                           'P3632',
                           'S3125',
                           'W4562')
  AND it1.id IN ('19');