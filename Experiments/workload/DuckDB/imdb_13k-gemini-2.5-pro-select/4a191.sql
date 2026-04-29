
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
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('19')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('B1252',
                           'E6214',
                           'G2326',
                           'G4541',
                           'J253',
                           'J5245',
                           'K2623',
                           'M6236',
                           'S565',
                           'T2523')
  AND (ci.note IN ('(co-executive producer)',
                   '(director of photography)',
                   '(story editor)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);