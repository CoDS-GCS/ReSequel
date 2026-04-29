
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('37')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3521',
                           'C4613',
                           'D512',
                           'D5462',
                           'E6242',
                           'H2636',
                           'J5232',
                           'J5623',
                           'K3653',
                           'M2635',
                           'M6353',
                           'N3415',
                           'N3526',
                           'P2435',
                           'T5316',
                           'W4562'))
  AND (ci.note IN ('(director of photography)',
                   '(line producer)',
                   '(producer)',
                   '(production assistant)',
                   '(program associate)',
                   '(script assistant)',
                   '(script coordinator)')
       OR ci.note IS NULL);