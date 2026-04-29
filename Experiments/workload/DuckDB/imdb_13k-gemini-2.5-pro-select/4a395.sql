
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('19')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A352',
                           'A3632',
                           'A6145',
                           'E5626',
                           'G6263',
                           'H6325',
                           'J1236',
                           'J1326',
                           'J51',
                           'J5212',
                           'J525',
                           'K2416',
                           'K3252',
                           'M2425',
                           'M2632',
                           'M6562',
                           'N265',
                           'T6252'))
  AND (ci.note IN ('(adprom associate)',
                   '(assistant floor manager)',
                   '(associate producer)',
                   '(developer)',
                   '(director of photography)',
                   '(executive producer)',
                   '(producer)',
                   '(story editor)',
                   '(voice)',
                   '(voice: Japanese version)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer');