
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('C246',
                           'C2613',
                           'C3524',
                           'C4253',
                           'D1316',
                           'D1326',
                           'D5352',
                           'G6352',
                           'I1425',
                           'R125',
                           'V2423')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actor',
                   'director',
                   'editor',
                   'producer',
                   'writer')
  AND it1.id IN ('25')
  AND (ci.note IN ('(executive producer)',
                   '(story)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);