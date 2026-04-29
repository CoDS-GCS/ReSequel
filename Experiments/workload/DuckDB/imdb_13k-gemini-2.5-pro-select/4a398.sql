WITH rt_filtered AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')),
     it_filtered AS
  (SELECT id
   FROM info_type
   WHERE id IN ('31'))
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN it_filtered AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN rt_filtered AS rt ON ci.role_id = rt.id
WHERE n.gender IS NULL
  AND (n.name_pcode_nf IN ('A4163',
                           'A5362',
                           'B6524',
                           'B6535',
                           'C6231',
                           'F6521',
                           'M5456',
                           'R1632',
                           'R2631')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(production assistant)')
       OR ci.note IS NULL);