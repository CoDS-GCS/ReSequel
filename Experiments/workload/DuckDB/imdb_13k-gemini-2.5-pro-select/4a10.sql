
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'B6535',
                           'C6262',
                           'D5234',
                           'J216',
                           'J2425',
                           'L6521',
                           'M2545',
                           'R1631',
                           'R2616',
                           'R5316',
                           'S3152'))
  AND (ci.note IN ('(producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'director',
                   'producer'))
  AND (it1.id IN ('37'));