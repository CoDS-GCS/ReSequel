
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C532',
                           'J1264',
                           'L6245',
                           'M261',
                           'R3624'))
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'editor',
                   'producer'))
  AND (it1.id IN ('19'));