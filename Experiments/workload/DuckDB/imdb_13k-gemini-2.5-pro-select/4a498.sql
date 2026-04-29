
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('31')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'director',
                   'editor',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5254',
                           'C5436',
                           'E1451',
                           'E162',
                           'F1626',
                           'F6524',
                           'G6231',
                           'H6315',
                           'J5426',
                           'L2152',
                           'M4261',
                           'P3525',
                           'P5451',
                           'R2416',
                           'R2526',
                           'R5323',
                           'S3126',
                           'S561'))
  AND (ci.note IN ('(archive footage)',
                   '(producer)',
                   '(writer)')
       OR ci.note IS NULL);