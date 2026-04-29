
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'miscellaneous crew',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C6265',
                           'E3631',
                           'J2151',
                           'K3136',
                           'M6316'))
  AND (ci.note IN ('(as Mirtha Ibarra)',
                   '(production coordinator)')
       OR ci.note IS NULL);