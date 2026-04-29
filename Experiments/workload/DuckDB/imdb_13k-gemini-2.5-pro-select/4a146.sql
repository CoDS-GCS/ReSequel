
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'producer')
  AND (ci.note IN ('(field producer)',
                   '(producer)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A52',
                           'A525',
                           'B434',
                           'C6165',
                           'D1323',
                           'D6254',
                           'E4652',
                           'J2625',
                           'J6251',
                           'L546',
                           'S312',
                           'S3252',
                           'S6264'))
  AND it1.id IN ('31');