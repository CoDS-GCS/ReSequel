
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B3252',
                           'C414',
                           'D262',
                           'E52',
                           'E6523',
                           'G253',
                           'J1232',
                           'J2352',
                           'J656',
                           'L2614',
                           'R2631',
                           'S316',
                           'Z252')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(head writer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);