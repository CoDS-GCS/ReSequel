WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('C62',
                           'G1636',
                           'G4514',
                           'G6215',
                           'J1245',
                           'J5253',
                           'K1565',
                           'K652',
                           'L6521',
                           'M32',
                           'M3416',
                           'N2526',
                           'O4562',
                           'P1452',
                           'P625',
                           'R1262',
                           'R265',
                           'R4163',
                           'S2351',
                           'S3632',
                           'T5143',
                           'T52',
                           'V2363',
                           'V5253')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
                   'editor',
                   'producer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('37')
  AND (ci.note IN ('(as Vincent San Antonio)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);