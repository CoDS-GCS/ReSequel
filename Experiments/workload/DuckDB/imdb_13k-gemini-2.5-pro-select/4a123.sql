
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'miscellaneous crew')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5354',
                           'K3623',
                           'L624',
                           'T526',
                           'Y15'))
  AND (ci.note IN ('(field cashier) (as Leah Arquillo)',
                   '(production executive)')
       OR ci.note IS NULL);