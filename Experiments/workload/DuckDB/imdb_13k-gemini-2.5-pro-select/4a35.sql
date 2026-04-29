
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
  AND n.name_pcode_nf IN ('A5351',
                           'C6452',
                           'G3236',
                           'K26',
                           'K6512',
                           'M4352',
                           'M5236',
                           'M6326',
                           'M6541',
                           'M6543',
                           'N345',
                           'W5325')
  AND (ci.note IN ('(script editor)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);