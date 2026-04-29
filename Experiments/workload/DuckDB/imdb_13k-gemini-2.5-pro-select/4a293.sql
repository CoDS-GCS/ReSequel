
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('E3623',
                           'E3631',
                           'M2414',
                           'M4232',
                           'M6243',
                           'R3265',
                           'X1656')
  AND (ci.note IN ('(producer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'producer',
                   'writer')
  AND it1.id IN ('37');