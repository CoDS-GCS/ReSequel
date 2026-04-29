
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('37')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5364',
                           'C6434',
                           'C6524',
                           'D5234',
                           'D526',
                           'D5452',
                           'F6521',
                           'M5236',
                           'N52',
                           'R1632',
                           'S4124',
                           'S5162',
                           'S5242',
                           'S5252'))
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'producer');