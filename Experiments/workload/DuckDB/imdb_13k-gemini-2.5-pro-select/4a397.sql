
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE rt.role IN ('actor',
                   'director',
                   'writer')
  AND (ci.note IN ('(writer)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5351',
                           'D1341',
                           'D5352',
                           'D6216',
                           'J1362',
                           'L2523',
                           'R5245',
                           'R5435',
                           'S5256',
                           'S5363',
                           'W4125')
       OR n.name_pcode_nf IS NULL)
  AND pi1.info_type_id IN ('37');