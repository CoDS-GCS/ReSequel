
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A2315',
                           'A4515',
                           'B6153',
                           'B6242',
                           'C252',
                           'C2536',
                           'D1325',
                           'E6416',
                           'G4163',
                           'G6534',
                           'I524',
                           'J5235',
                           'J6512',
                           'K1524',
                           'K253',
                           'L5216',
                           'N4525',
                           'R4135',
                           'S2352',
                           'S5265',
                           'T3621',
                           'T4',
                           'V5253')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('32')
  AND (ci.note IN ('(co-executive producer)',
                   '(credit only)',
                   '(producer)',
                   '(supervising producer)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);