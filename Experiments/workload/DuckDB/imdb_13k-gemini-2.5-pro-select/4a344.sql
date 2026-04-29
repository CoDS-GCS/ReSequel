
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('22')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5353',
                           'B5342',
                           'E5626',
                           'G65',
                           'H1631',
                           'I162',
                           'J23',
                           'J2326',
                           'P4564',
                           'S2521',
                           'V4231',
                           'Y5252'))
  AND (ci.note IN ('(producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'producer');