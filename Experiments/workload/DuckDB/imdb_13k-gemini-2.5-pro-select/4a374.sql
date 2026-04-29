
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A4253',
                           'B6164',
                           'C3656',
                           'D525',
                           'F6524',
                           'J5616',
                           'K452',
                           'L25',
                           'M2416',
                           'M2525',
                           'M6245',
                           'S4125',
                           'T6216',
                           'T6253')
  AND ci.note IS NULL
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'editor'))
  AND pi.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('22'));