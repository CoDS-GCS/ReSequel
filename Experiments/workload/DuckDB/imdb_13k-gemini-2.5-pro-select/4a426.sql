
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4253',
                           'A5362',
                           'A6532',
                           'C6231',
                           'C6235',
                           'M6216',
                           'R1634',
                           'R516',
                           'R5316',
                           'S3162',
                           'S3521')
  AND (ci.note IN ('(deviser)',
                   '(overall in charge of promotion)',
                   '(producer)',
                   '(senior producer)',
                   '(supervising producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('19');