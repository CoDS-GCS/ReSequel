
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B6251',
                           'D1323',
                           'G212',
                           'J6326',
                           'P3641')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('composer',
                   'producer',
                   'writer')
  AND it1.id IN ('32')
  AND (ci.note IN ('(creator)',
                   '(executive producer)',
                   '(producer)',
                   '(written by)')
       OR ci.note IS NULL);