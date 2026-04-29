
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4163',
                           'A5351',
                           'B6535',
                           'C4135',
                           'C5165',
                           'G2316',
                           'H4532',
                           'H5256',
                           'I2625',
                           'J652',
                           'P3623',
                           'P426',
                           'R2632',
                           'R5324',
                           'T534'))
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'producer')
  AND it1.id IN ('31');