
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'editor')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('G6242',
                           'G6252',
                           'J24',
                           'J514',
                           'J53',
                           'L2165',
                           'M2545',
                           'M625',
                           'M6256',
                           'M6352',
                           'N2424',
                           'R1632',
                           'V2365')
  AND it1.id IN ('22');