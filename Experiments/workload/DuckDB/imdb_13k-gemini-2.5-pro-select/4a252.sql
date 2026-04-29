
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'costume designer',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6534',
                           'G6265',
                           'J263',
                           'K153',
                           'K6516',
                           'L6262',
                           'M2351',
                           'N3421',
                           'R2634',
                           'R5354'))
  AND (ci.note IN ('(as Karen J. Braverman)',
                   '(as Richard Lemieuvre)',
                   '(associate producer)',
                   '(co-producer)',
                   '(producer)',
                   '(program associate)',
                   '(uncredited)',
                   '(written by)')
       OR ci.note IS NULL);