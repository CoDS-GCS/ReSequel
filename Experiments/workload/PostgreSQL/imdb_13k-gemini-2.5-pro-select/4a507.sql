
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A4215',
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
                           'W4524'))) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON rt.id = ci.role_id
   WHERE (ci.note IN ('(associate producer)',
                   '(executive producer)',
                   '(producer)',
                   '(promo producer)',
                   '(uncredited)')
          OR ci.note IS NULL)
     AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer')) AS ci ON n.id = ci.person_id
JOIN
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('25')) AS pi1 ON n.id = pi1.person_id;