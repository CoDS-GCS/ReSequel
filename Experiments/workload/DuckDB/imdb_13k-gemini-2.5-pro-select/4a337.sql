
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A4126',
                           'A5354',
                           'B53',
                           'C642',
                           'E6243',
                           'F6526',
                           'I5351',
                           'J1625',
                           'J2414',
                           'J2636',
                           'J5362',
                           'L5',
                           'L5263',
                           'L6361',
                           'M2521',
                           'M6325',
                           'N1626',
                           'Y1262',
                           'Y5265')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(archive footage)',
                   '(co-executive producer)',
                   '(developed for television by)',
                   '(line producer: FUNimation Entertainment)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);