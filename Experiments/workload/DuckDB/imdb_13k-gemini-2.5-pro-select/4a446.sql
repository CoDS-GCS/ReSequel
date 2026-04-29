
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
  AND (ci.note IN ('(computer/video playback supervisor)',
                   '(contributing writer)',
                   '(executive producer)',
                   '(location manager)',
                   '(other crew)',
                   '(producer)',
                   '(production assistant)',
                   '(production secretary)',
                   '(researcher)')
       OR ci.note IS NULL)
  AND n.gender IS NULL
  AND n.name_pcode_nf IN ('A5242',
                           'B5263',
                           'C6431',
                           'D5213',
                           'E4523',
                           'E62',
                           'E6256',
                           'G516',
                           'G6564',
                           'J54',
                           'K4235',
                           'L2426',
                           'L2621',
                           'M2164',
                           'M3243',
                           'M4245',
                           'M625',
                           'M6425',
                           'P3653',
                           'P5252',
                           'R562',
                           'T535',
                           'V2363')
  AND it1.id IN ('26');