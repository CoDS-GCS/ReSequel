WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A5351',
                           'B6525',
                           'F6362',
                           'I235',
                           'K6216',
                           'O2431',
                           'Q5252',
                           'S1235',
                           'T5452',
                           'V2361')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('19')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);