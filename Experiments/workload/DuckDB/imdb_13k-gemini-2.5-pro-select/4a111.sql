
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5365',
                           'C4152',
                           'C6452',
                           'D65',
                           'H6515',
                           'I1541',
                           'J2163',
                           'J5264',
                           'L4216',
                           'L6526',
                           'L6531',
                           'M2412',
                           'M4263',
                           'M5353',
                           'M6352',
                           'R1632',
                           'R4163',
                           'S3526',
                           'T4635',
                           'T5352',
                           'U52',
                           'V4616'))
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(production accountant)',
                   '(production assistant)',
                   '(series producer)',
                   '(stage manager)',
                   '(storyliner)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('34'));