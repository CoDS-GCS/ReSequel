
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('31')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4526',
                           'A5361',
                           'A5362',
                           'B4125',
                           'C62',
                           'E2615',
                           'H2426',
                           'I245',
                           'K1352',
                           'L5162',
                           'R2562',
                           'S415',
                           'T65',
                           'Y6524'))
  AND (ci.note IN ('(clearance supervisor)',
                   '(co-executive producer)',
                   '(main title design)',
                   '(producer)',
                   '(production assistant)',
                   '(voice: English version)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'miscellaneous crew',
                   'producer',
                   'writer');