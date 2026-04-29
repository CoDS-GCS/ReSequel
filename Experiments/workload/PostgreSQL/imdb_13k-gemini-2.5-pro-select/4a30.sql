
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3514',
                           'A4163',
                           'A5215',
                           'A5326',
                           'B6252',
                           'B6524',
                           'C6256',
                           'D6532',
                           'G1513',
                           'G4326',
                           'H1612',
                           'J1316',
                           'K1565',
                           'L242',
                           'M5216',
                           'M6216',
                           'M6323',
                           'N2614',
                           'N5321',
                           'R1232',
                           'R5352',
                           'S1524',
                           'S3242',
                           'S536',
                           'T5316'))
  AND (ci.note IN ('(co-executive producer)',
                   '(creator)',
                   '(executive producer)',
                   '(producer)',
                   '(script supervisor)',
                   '(supervising producer) (as Albert B. Almaden)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);