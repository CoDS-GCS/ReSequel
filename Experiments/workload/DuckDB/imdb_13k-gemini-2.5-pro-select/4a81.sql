WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A3525',
                           'A4212',
                           'C2616',
                           'E3623',
                           'G16',
                           'H2536',
                           'H6353',
                           'K523',
                           'M2436',
                           'M3523',
                           'M4524',
                           'R2162',
                           'S3535',
                           'S3632',
                           'S526',
                           'T5625',
                           'W525',
                           'X1653')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('32')
  AND (ci.note IN ('(director of photography)',
                   '(producer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);