
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'composer',
                   'director',
                   'producer',
                   'writer')
  AND (ci.note IN ('(executive producer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6321',
                           'B6524',
                           'D52',
                           'E6242',
                           'G6351',
                           'J546',
                           'M2123',
                           'N532',
                           'P3625',
                           'R1634',
                           'R4531',
                           'S3635',
                           'W4512'))
  AND it1.id IN ('37');