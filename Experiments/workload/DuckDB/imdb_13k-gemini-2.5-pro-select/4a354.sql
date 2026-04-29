
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A241',
                           'A5364',
                           'A5654',
                           'B3242',
                           'B4235',
                           'C532',
                           'C6431',
                           'D514',
                           'D5253',
                           'D5452',
                           'D6525',
                           'G5432',
                           'G6451',
                           'G6534',
                           'J2136',
                           'J314',
                           'K245',
                           'K5263',
                           'L2146',
                           'M3415',
                           'R353',
                           'S3126',
                           'S6253'))
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(voice)',
                   '(written by)')
       OR ci.note IS NULL);