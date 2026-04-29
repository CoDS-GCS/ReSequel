
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('B3265',
                           'G2424',
                           'G4163',
                           'I5136',
                           'I6542',
                           'J434',
                           'K5425',
                           'M6452',
                           'N2351',
                           'R1235',
                           'S2354',
                           'S241',
                           'S3125',
                           'S3151')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'actress',
                   'producer',
                   'writer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(creator)',
                   '(executive producer)',
                   '(voice)')
       OR ci.note IS NULL);