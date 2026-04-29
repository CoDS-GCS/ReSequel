
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'writer')
  AND it1.id IN ('31')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A4214',
                           'C5326',
                           'C6543',
                           'E4524',
                           'E4536',
                           'F6531',
                           'J4236',
                           'J5242',
                           'L6252',
                           'M6256',
                           'M6323',
                           'O4212',
                           'R2456',
                           'V6251')
  AND (ci.note IN ('(writer)')
       OR ci.note IS NULL);