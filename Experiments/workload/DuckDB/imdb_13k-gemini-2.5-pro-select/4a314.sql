
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('34')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5313',
                           'A5325',
                           'C2524',
                           'C6256',
                           'E4236',
                           'F6525',
                           'G6253',
                           'H3635',
                           'J4232',
                           'J5234',
                           'L5252',
                           'M4261',
                           'M5265',
                           'M5325',
                           'M625',
                           'M652',
                           'N4316',
                           'P3625',
                           'S3216',
                           'S6262',
                           'T6263',
                           'T6525',
                           'V212'))
  AND (ci.note IN ('(assistant producer)',
                   '(creative consultant)',
                   '(deko operator)',
                   '(director of photography)',
                   '(executive producer)',
                   '(location manager)',
                   '(main title design)',
                   '(producer)',
                   '(production administrator)',
                   '(production coordinator)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer');