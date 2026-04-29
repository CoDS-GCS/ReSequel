WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A6216',
                           'B4653',
                           'B6153',
                           'B6234',
                           'B6525',
                           'C435',
                           'C565',
                           'C6213',
                           'D51',
                           'E5413',
                           'G1621',
                           'G4252',
                           'G4514',
                           'K54',
                           'L5142',
                           'M3214',
                           'M4245',
                           'N6523',
                           'P4142',
                           'P6165',
                           'S3243',
                           'S5256')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director',
                   'producer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('22')
  AND (ci.note IN ('(as Brigitte Walbrunn)',
                   '(executive producer)',
                   '(uncredited)')
       OR ci.note IS NULL);