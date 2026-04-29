
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5143',
                           'B3416',
                           'D1214',
                           'D5212',
                           'G1543',
                           'H3546',
                           'J3143',
                           'L6562',
                           'O3424',
                           'S5632',
                           'Y252'))
  AND (ci.note IN ('(co-executive producer)',
                   '(credit only)')
       OR ci.note IS NULL);