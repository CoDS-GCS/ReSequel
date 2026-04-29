
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B3462',
                           'C6312',
                           'D6316',
                           'E4262',
                           'G1643',
                           'G262',
                           'I2141',
                           'I5252',
                           'J5352',
                           'L5265',
                           'M6314',
                           'R5162',
                           'S3256',
                           'S4262',
                           'S616',
                           'S6162',
                           'V2535',
                           'V4652',
                           'Y2562')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'writer')
  AND it1.id IN ('34')
  AND (ci.note IN ('(writer)')
       OR ci.note IS NULL);