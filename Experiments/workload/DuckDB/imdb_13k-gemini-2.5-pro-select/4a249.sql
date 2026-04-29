
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress')
  AND it1.id IN ('31')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A5152',
                           'A5362',
                           'C612',
                           'C6235',
                           'D1626',
                           'D5162',
                           'F4256',
                           'G6316',
                           'I6526',
                           'K4523',
                           'L2545',
                           'L3263',
                           'L5165',
                           'M646',
                           'N6212')
  AND (ci.note IN ('(Animax Asia dub)',
                   '(archive footage)')
       OR ci.note IS NULL);