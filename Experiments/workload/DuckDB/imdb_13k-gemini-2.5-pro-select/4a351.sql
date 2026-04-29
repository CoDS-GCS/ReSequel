
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('34')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A4251',
                           'B323',
                           'B6164',
                           'C345',
                           'D6426',
                           'E1321',
                           'E5346',
                           'F4253',
                           'G5635',
                           'I26',
                           'I3435',
                           'K6526',
                           'L4231',
                           'L5343',
                           'M2153',
                           'M5635',
                           'M6241',
                           'P35',
                           'R154',
                           'S1263',
                           'S2316',
                           'S3251',
                           'S4213',
                           'T5424',
                           'Y3625')
  AND (ci.note IN ('(as Barbara Luna)',
                   '(assistant: Rodrigo Garcia)',
                   '(executive producer)',
                   '(senior vice president)')
       OR ci.note IS NULL);