
SELECT COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IS NULL
  AND (n.name_pcode_nf IN ('A3524',
                           'A4253',
                           'B6565',
                           'D5262',
                           'J5245',
                           'M5262',
                           'M5265',
                           'W4152')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(producer)',
                   '(storyliner)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('editor',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('19');