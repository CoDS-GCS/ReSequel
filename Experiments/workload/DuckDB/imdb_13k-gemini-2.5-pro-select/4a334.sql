
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A2463',
                           'B5252',
                           'D4251',
                           'D5256',
                           'E3161',
                           'I5253',
                           'J52',
                           'L6214',
                           'M424',
                           'N2543',
                           'P4242',
                           'S2145',
                           'S3562',
                           'S3634',
                           'T4165',
                           'T5623',
                           'V2363',
                           'W23',
                           'Z2146')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('26')
  AND (ci.note IN ('(creator)',
                   '(executive producer: TV3)',
                   '(producer)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);