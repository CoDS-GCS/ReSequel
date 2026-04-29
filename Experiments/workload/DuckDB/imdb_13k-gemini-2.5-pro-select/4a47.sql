
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('C6351',
                           'K152',
                           'K6265',
                           'R1634',
                           'T5452',
                           'V5232')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'actress',
                   'editor',
                   'producer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(executive producer)',
                   '(voice)')
       OR ci.note IS NULL);