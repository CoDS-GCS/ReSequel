
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(associate producer)',
                   '(co-executive producer)',
                   '(director of photography) (as John C. Newby)',
                   '(executive assistant: Mr. Scott)',
                   '(payroll accountant)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(script coordinator)',
                   '(segment associate producer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4263',
                           'C6165',
                           'C6215',
                           'D5246',
                           'D54',
                           'E2315',
                           'J25',
                           'J3216',
                           'J4252',
                           'J51',
                           'J53',
                           'J61',
                           'K3652',
                           'L2416',
                           'M342',
                           'M4543',
                           'P4162',
                           'S2352',
                           'S312',
                           'T565',
                           'W4314',
                           'W4545',
                           'W6561'))
  AND it1.id IN ('32');