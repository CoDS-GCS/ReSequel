
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE (gender IN ('m')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A5351',
                           'D1341',
                           'D5352',
                           'D6216',
                           'J1362',
                           'L2523',
                           'R5245',
                           'R5435',
                           'S5256',
                           'S5363',
                           'W4125')
          OR name_pcode_nf IS NULL)) AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'director',
                   'writer')
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
AND it1.id IN ('37')
WHERE (ci.note IN ('(writer)')
       OR ci.note IS NULL);