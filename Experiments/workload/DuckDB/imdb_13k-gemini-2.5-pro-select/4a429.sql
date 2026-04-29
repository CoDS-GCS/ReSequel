
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE (gender IN ('f')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('H4535',
                           'K2512',
                           'M6325',
                           'R2326',
                           'R53'))) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN
  (SELECT ci.person_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON rt.id = ci.role_id
   WHERE (ci.note IN ('(dialogue)',
                   '(producer)')
          OR ci.note IS NULL)
     AND rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'producer',
                   'writer')) AS ci ON n.id = ci.person_id
JOIN
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('26')) AS pi1 ON n.id = pi1.person_id;