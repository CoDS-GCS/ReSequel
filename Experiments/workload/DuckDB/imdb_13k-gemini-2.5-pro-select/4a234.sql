
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B6563',
                           'D1321',
                           'D1323',
                           'D134',
                           'D6242',
                           'J5265',
                           'P3621',
                           'P453',
                           'R1635',
                           'S2613',
                           'T6363')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(producer)',
                   '(voice)',
                   '(written by)')
       OR ci.note IS NULL);