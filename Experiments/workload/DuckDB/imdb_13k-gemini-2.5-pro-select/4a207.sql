WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A4632',
                           'A65',
                           'B6412',
                           'B6542',
                           'D242',
                           'E3123',
                           'E62',
                           'F2325',
                           'G4563',
                           'J5341',
                           'J5365',
                           'K4325',
                           'K656',
                           'L3616',
                           'M2152',
                           'P3162',
                           'P412',
                           'P4126',
                           'S3151',
                           'S3162',
                           'S63',
                           'T5264',
                           'W4512')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'producer',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('31')
  AND (ci.note IN ('(co-director)',
                   '(creator) (as Michael Evans)',
                   '(creator)',
                   '(executive producer)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);