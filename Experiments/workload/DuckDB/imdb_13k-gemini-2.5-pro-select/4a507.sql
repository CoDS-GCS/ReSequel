
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4215',
                           'A5241',
                           'A6365',
                           'B5252',
                           'B6252',
                           'G1616',
                           'H5621',
                           'H6163',
                           'I5616',
                           'J2352',
                           'J5425',
                           'M6142',
                           'O1626',
                           'O2432',
                           'P2565',
                           'P4241',
                           'R2652',
                           'R3265',
                           'S5253',
                           'T2514',
                           'T6264',
                           'V2523',
                           'W4524'))
  AND (ci.note IN ('(associate producer)',
                   '(executive producer)',
                   '(producer)',
                   '(promo producer)',
                   '(uncredited)')
       OR ci.note IS NULL);