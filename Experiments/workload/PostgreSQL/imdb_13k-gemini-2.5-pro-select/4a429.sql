
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('H4535',
                           'K2512',
                           'M6325',
                           'R2326',
                           'R53'))
  AND (ci.note IN ('(dialogue)',
                   '(producer)')
       OR ci.note IS NULL);