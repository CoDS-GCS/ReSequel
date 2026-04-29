
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A145',
                           'A4535',
                           'C3265',
                           'E6212',
                           'F4212',
                           'G4136',
                           'J14',
                           'J53',
                           'L5253',
                           'M2412',
                           'M2465',
                           'M341',
                           'M343',
                           'P3521',
                           'P365',
                           'R5342',
                           'T525',
                           'T6326',
                           'T6525',
                           'W4653',
                           'W5323',
                           'Y6234',
                           'Z3524')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('32')
  AND (ci.note IN ('(archive footage)',
                   '(creator)',
                   '(director of photography)',
                   '(executive producer) (as Randy Zisk)',
                   '(executive producer)',
                   '(producer)',
                   '(voice director)',
                   '(voice) (as Lani Tupu)',
                   '(writer)')
       OR ci.note IS NULL);