
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5252',
                           'A5362',
                           'B3512',
                           'C32',
                           'C5264',
                           'D16',
                           'D63',
                           'E2141',
                           'F6525',
                           'H1216',
                           'J2321',
                           'J4165',
                           'K3645',
                           'K5363',
                           'M631',
                           'N1216',
                           'O425',
                           'P3624',
                           'P4126',
                           'R3165',
                           'R5632',
                           'S5352',
                           'S5634',
                           'V5362')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);