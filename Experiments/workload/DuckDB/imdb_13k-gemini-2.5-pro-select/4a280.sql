
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A5',
                           'A5314',
                           'A6435',
                           'B6356',
                           'C6252',
                           'D3562',
                           'D5214',
                           'E525',
                           'G4521',
                           'I415',
                           'J434',
                           'K1463',
                           'K2524',
                           'K3126',
                           'K6235',
                           'N616',
                           'R2352',
                           'R3232',
                           'R5252',
                           'S1356',
                           'S1563',
                           'S6261',
                           'T253',
                           'Y2365')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'producer',
                   'production designer')
  AND it1.id IN ('34')
  AND (ci.note IN ('(as Dhu Moraes)',
                   '(producer)',
                   '(voice)')
       OR ci.note IS NULL);