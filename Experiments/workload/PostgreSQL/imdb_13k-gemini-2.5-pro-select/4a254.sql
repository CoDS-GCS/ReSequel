
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE rt.role IN ('actor',
                   'composer',
                   'writer')
  AND (ci.note IN ('(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
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
  AND pi1.info_type_id IN ('31');