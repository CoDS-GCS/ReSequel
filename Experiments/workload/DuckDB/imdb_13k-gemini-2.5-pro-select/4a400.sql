
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('G1642',
                           'J5263',
                           'K52',
                           'K6234',
                           'M62',
                           'R516',
                           'T6253')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(senior producer)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN ('19')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'producer'));