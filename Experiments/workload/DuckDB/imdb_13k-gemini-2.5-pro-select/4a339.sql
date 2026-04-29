
SELECT COUNT(*)
FROM name AS n
INNER JOIN cast_info AS ci ON n.id = ci.person_id
INNER JOIN person_info AS pi1 ON n.id = pi1.person_id
INNER JOIN aka_name AS an ON n.id = an.person_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3651',
                           'E4562',
                           'M6562',
                           'N2425')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'producer')
  AND it1.id IN ('37');