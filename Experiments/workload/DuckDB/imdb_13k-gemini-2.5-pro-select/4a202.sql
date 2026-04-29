
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(director of photography) (as Elmer Haresco Despa)',
                   '(location unit manager)',
                   '(producer)',
                   '(script supervisor)',
                   '(technical supervisor)',
                   '(teleprompter operator)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A424',
                           'A5215',
                           'A5231',
                           'A5316',
                           'A5362',
                           'C4632',
                           'C54',
                           'E4563',
                           'F3516',
                           'I1562',
                           'J345',
                           'J5235',
                           'K346',
                           'M3521',
                           'M62',
                           'P3616',
                           'R2326',
                           'S6562',
                           'T5625',
                           'V2423',
                           'Y25'))
  AND it1.id IN ('37');