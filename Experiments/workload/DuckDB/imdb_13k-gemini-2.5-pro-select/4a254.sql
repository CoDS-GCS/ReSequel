
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'composer',
                   'writer')
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
AND it1.id IN ('31')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4253',
                           'A5362',
                           'B6525',
                           'C6424',
                           'F6526',
                           'H5621',
                           'H626',
                           'J216',
                           'J2525',
                           'L252',
                           'S3126')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(voice)',
                   '(writer)')
       OR ci.note IS NULL);