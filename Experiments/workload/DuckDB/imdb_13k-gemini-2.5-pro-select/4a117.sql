
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND (name_pcode_nf IN ('A4163',
                           'A4526',
                           'A5352',
                           'B6535',
                           'C6231',
                           'C6426',
                           'F6521',
                           'G6212',
                           'M5456',
                           'P3623',
                           'P3625',
                           'R1632')
          OR name_pcode_nf IS NULL)) AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(production assistant)')
       OR ci.note IS NULL);