
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6365',
                           'B6512',
                           'C454',
                           'D1546',
                           'D5254',
                           'E5462',
                           'G1643',
                           'J2152',
                           'L52',
                           'M2434',
                           'M2462',
                           'M2524',
                           'N4546',
                           'P3615',
                           'P3652',
                           'P4265',
                           'S5324',
                           'T542',
                           'T656',
                           'W4524',
                           'Y6253'))
  AND (ci.note IN ('(executive producer)',
                   '(financial)',
                   '(producer)',
                   '(uncredited)')
       OR ci.note IS NULL);