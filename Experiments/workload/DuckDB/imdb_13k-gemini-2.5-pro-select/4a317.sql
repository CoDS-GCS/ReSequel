
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('B6162',
                           'C5354',
                           'C6563',
                           'E4163',
                           'J2154',
                           'J4526',
                           'K6426',
                           'L235',
                           'L4521',
                           'L6321',
                           'L6534',
                           'M13',
                           'M2524',
                           'M2635',
                           'N2421',
                           'P4521',
                           'S1626',
                           'S5265',
                           'T3526')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'producer')
  AND it1.id IN ('22')
  AND (ci.note IN ('(executive producer)',
                   '(post production producer)',
                   '(voice)')
       OR ci.note IS NULL);