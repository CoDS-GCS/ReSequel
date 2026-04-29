WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A4251',
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
                           'Y3625'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('34')
  AND (ci.note IN ('(as Barbara Luna)',
                   '(assistant: Rodrigo Garcia)',
                   '(executive producer)',
                   '(senior vice president)')
       OR ci.note IS NULL);