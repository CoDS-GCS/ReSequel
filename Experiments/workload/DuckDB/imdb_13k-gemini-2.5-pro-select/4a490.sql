
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A3165',
                           'A4263',
                           'A5356',
                           'B6316',
                           'B6512',
                           'E6523',
                           'H542',
                           'I1545',
                           'R15',
                           'S1312',
                           'V5326')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'actress',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(developer)',
                   '(executive producer)',
                   '(producer)',
                   '(written by)')
       OR ci.note IS NULL);