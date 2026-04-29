
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B2632',
                           'B6164',
                           'B626',
                           'C3162',
                           'C4362',
                           'C6425',
                           'C6426',
                           'G6265',
                           'H6435',
                           'J51',
                           'K2321',
                           'K4',
                           'K6235',
                           'L561',
                           'L6512',
                           'M2536',
                           'M4564',
                           'M6262',
                           'P4134',
                           'S21',
                           'S3165',
                           'S5425',
                           'V4356')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(as Mary Grace Ligon-Payumo)',
                   '(co-executive producer)',
                   '(comic strip)',
                   '(developer)',
                   '(director of photography) (as John C. Newby)',
                   '(executive producer)',
                   '(presenter)',
                   '(producer)',
                   '(production coordinator)',
                   '(script coordinator)',
                   '(supervising producer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('25');