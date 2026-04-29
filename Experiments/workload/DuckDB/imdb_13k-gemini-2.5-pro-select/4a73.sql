
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'director',
                   'writer')
  AND it1.id IN ('19')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A32',
                           'B6561',
                           'C3165',
                           'C6231',
                           'D6562',
                           'E5621',
                           'F6532',
                           'H4532',
                           'H6425',
                           'R2424',
                           'S3123',
                           'S3153',
                           'T256',
                           'W4513',
                           'Y5242')
  AND (ci.note IN ('(as Stephen Gustafson)',
                   '(uncredited)',
                   '(voice)',
                   '(written by)')
       OR ci.note IS NULL);