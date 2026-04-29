
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B5254',
                           'B6516',
                           'C5651',
                           'C6231',
                           'C6253',
                           'E4213',
                           'J1415',
                           'K6425',
                           'L216',
                           'M6232',
                           'M6243',
                           'P4265',
                           'S3151',
                           'T4626',
                           'T525',
                           'V5256'))
  AND (ci.note IN ('(co-executive producer)',
                   '(creator)',
                   '(medical advisor)',
                   '(producer)',
                   '(story)',
                   '(voice)')
       OR ci.note IS NULL);