
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A6512',
                           'B6532',
                           'D5312',
                           'E5423',
                           'F3212',
                           'G6316',
                           'I2121',
                           'J2125',
                           'M2352',
                           'M2451',
                           'M4125',
                           'N3565',
                           'O5631',
                           'P4261',
                           'P4652',
                           'P645',
                           'R3145',
                           'R4126',
                           'W6352'))
  AND (ci.note IN ('(developer)',
                   '(production assistant)',
                   '(production team)',
                   '(story producer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);