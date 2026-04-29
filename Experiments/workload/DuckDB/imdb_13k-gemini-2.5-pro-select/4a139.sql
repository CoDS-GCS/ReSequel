
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'composer',
                   'producer',
                   'writer')
  AND it1.id IN ('37')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('B6536',
                           'C2525',
                           'D2623',
                           'D535',
                           'E5425',
                           'E652',
                           'F632',
                           'G5242',
                           'H6323',
                           'H6326',
                           'K6465',
                           'L2621',
                           'N2561',
                           'O6424',
                           'R5654',
                           'S142')
  AND (ci.note IN ('(executive producer)',
                   '(writer)')
       OR ci.note IS NULL);