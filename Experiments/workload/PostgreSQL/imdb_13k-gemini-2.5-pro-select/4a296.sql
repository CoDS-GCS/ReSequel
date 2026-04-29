WITH valid_persons AS
  (SELECT n.id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('C62',
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
                           'V5253'))
SELECT COUNT(*)
FROM valid_persons vp
JOIN cast_info ci ON vp.id = ci.person_id
JOIN role_type rt ON ci.role_id = rt.id
JOIN person_info pi1 ON vp.id = pi1.person_id
JOIN info_type it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'composer',
                   'editor',
                   'producer')
  AND it1.id IN ('37')
  AND (ci.note IN ('(as Vincent San Antonio)',
                   '(producer)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL);