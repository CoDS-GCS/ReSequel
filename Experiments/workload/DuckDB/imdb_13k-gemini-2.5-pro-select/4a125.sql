
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('19')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A4123',
                           'A4162',
                           'B6152',
                           'E4363',
                           'F6526',
                           'I6541',
                           'J2352',
                           'J25',
                           'J5352',
                           'J5632',
                           'M2423',
                           'M2523',
                           'M4635',
                           'N1352',
                           'P6212',
                           'P6262',
                           'S5252',
                           'T2426',
                           'T512',
                           'T5141',
                           'V5216',
                           'Z6563')
  AND (ci.note IN ('(format by)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);