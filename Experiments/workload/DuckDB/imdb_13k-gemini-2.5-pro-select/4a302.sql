
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A6252',
                           'E5621',
                           'J4263',
                           'J5435',
                           'M2464',
                           'M252',
                           'M32',
                           'P4123')
  AND ci.note IS NULL
  AND pi1.info_type_id IN ('31')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'));