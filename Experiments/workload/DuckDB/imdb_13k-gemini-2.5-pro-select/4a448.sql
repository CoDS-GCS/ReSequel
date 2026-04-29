
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('B4521',
                           'B6535',
                           'C24',
                           'C6425',
                           'I2163',
                           'I5263',
                           'J252',
                           'K3615',
                           'L2363',
                           'R3264',
                           'S4152',
                           'T2563',
                           'T5252')
  AND (ci.note IN ('(dialogue) (uncredited)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'producer',
                   'writer')
  AND it1.id IN ('22');